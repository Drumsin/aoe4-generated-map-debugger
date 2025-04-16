const fs = require('fs');
const path = require('path');
const xml2js = require('xml2js');

const terrainDir = path.resolve(__dirname, 'custom_terrain_types');
const mapSetupPath = path.resolve(__dirname, 'lua-imports/map-setup.lua');
const scssPath = path.resolve(__dirname, 'sass/_terrain-types.scss');

console.log('Starting custom-terrain-types.js...');

// Helper to recursively find XML files
function findXmlFiles(dir) {
    console.log(`Scanning directory: ${dir}`);
    let results = [];
    if (fs.existsSync(dir)) {
        const list = fs.readdirSync(dir);
        list.forEach(file => {
            const filePath = path.join(dir, file);
            const stat = fs.statSync(filePath);
            if (stat && stat.isDirectory()) {
                results = results.concat(findXmlFiles(filePath));
            } else if (file.endsWith('.xml')) {
                results.push(filePath);
            }
        });
    }
    console.log(`Found XML files: ${results}`);
    return results;
}

// Parse XML and extract terrain data
async function parseXml(filePath) {
    console.log(`Parsing XML file: ${filePath}`);
    const xmlContent = fs.readFileSync(filePath, 'utf8');
    const parser = new xml2js.Parser();
    const result = await parser.parseStringPromise(xmlContent);
    const terrainName = path.basename(filePath, '.xml');

    // Extract and process the debug_colour value
    let debugColor = '666666'; // Default color
    const colorNode = result?.instance?.group?.[0]?.colour?.[0]?.$?.value;
    if (colorNode) {
        const value = parseInt(colorNode, 10); // Convert to integer
        const rgbValue = value % 16777216; // Modulo operation to ensure it's within RGB range
        debugColor = rgbValue.toString(16).padStart(6, '0').toUpperCase(); // Convert to hex and pad
    }

    console.log(`Extracted terrain: ${terrainName}, color: ${debugColor}`);
    return { name: terrainName, color: debugColor };
}

// Update map-setup.lua
function updateMapSetupLua(terrainNames) {
    console.log('Updating map-setup.lua...');
    const luaContent = fs.readFileSync(mapSetupPath, 'utf8');
    const customRegex = /customTerrainTypes\s*=\s*{([^}]*)}/s;
    const match = luaContent.match(customRegex);

    if (match) {
        const updatedCustomList = terrainNames.map(name => `"${name}"`).join(',\n');
        const updatedContent = luaContent.replace(
            customRegex,
            `customTerrainTypes = {\n${updatedCustomList}\n}`
        );

        fs.writeFileSync(mapSetupPath, updatedContent, 'utf8');
        console.log('map-setup.lua updated successfully.');
    } else {
        console.error('Could not find customTerrainTypes in map-setup.lua');
    }
}


// Update _terrain-types.scss
function updateScss(terrainData) {
    console.log('Updating _terrain-types.scss...');
    const scssContent = fs.readFileSync(scssPath, 'utf8');
    const customRegex = /\$custom_terrain_types:\s*\(([^)]*)\);/s;
    const match = scssContent.match(customRegex);

    if (match) {
        const updatedCustomMap = terrainData
            .map(({ name, color }) => `"${name}":"${color}"`)
            .join(',\n');
        const updatedContent = scssContent.replace(
            customRegex,
            `$custom_terrain_types: (\n${updatedCustomMap}\n);`
        );

        fs.writeFileSync(scssPath, updatedContent, 'utf8');
        console.log('_terrain-types.scss updated successfully.');
    } else {
        console.error('Could not find $custom_terrain_types in _terrain-types.scss');
    }
}


// Main function
async function main() {
    try {
        console.log('Finding XML files...');
        const xmlFiles = findXmlFiles(terrainDir);
        const terrainData = await Promise.all(xmlFiles.map(parseXml));
        const terrainNames = terrainData.map(data => data.name);

        updateMapSetupLua(terrainNames);
        updateScss(terrainData);
        console.log('custom-terrain-types.js completed successfully.');
    } catch (error) {
        console.error('Error in custom-terrain-types.js:', error);
        process.exit(1); // Exit with error code
    }
}

main();
