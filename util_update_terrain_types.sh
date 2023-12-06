# Utility script for updating the debugger terrain types quickly
# From command line run "sudo bash util_update_terrain_types.sh". Make sure to update folder path.
# Bash utility script to print out all terrain types located in a map_gen_terrain_type folder along with their debug colours.
# Useful for quickly copy and pasting the defined terrain types for _terrain-types.scss
# Along with copying and pasting the defined terrain types for map-setup.lua

# Define the folder path
folder="./map_gen_terrain_type"

# Create an empty array for the output
terrain_types=()

# Create another empty array for the terrain type names only
terrain_names=()

# Loop through each XML file in the folder and its subfolders
for file in $(find $folder -name "*.xml"); do
    
    # Get the file name without the extension
    name=$(basename $file .xml)

    # Parse the XML content
    xml=$(cat $file)

    # Get the value of the debug_colour attribute
    value=$(echo $xml | grep -oP 'name="debug_colour" value="\K\d+')

    # Check if value is zero
    if [[ $value -eq 0 ]]; then
        # No color value assigned for hex value, so we give it a lighter color from default
        hex=666666
    else
        # Get the remainder of dividing value by 16777216
        value=$(expr $value % 16777216)
        # Convert the rgba decimal value to a hex value
        hex=$(printf "%06X" $value)
    fi

    # Append the file name and hex value pair to the output array
    terrain_types+=("\"$name\":\"$hex\"")

    # Append the file name only to the terrain names array
    terrain_names+=("\"$name\"")
done

# tt_none terrain added to lists since it's not an actual file
terrain_types+=("\"tt_none\": \"333333\"")
terrain_names+=("\"tt_none\"")

printf "SASS Terrain Types and Debug Colours to update in _terrain-types.scss\\n"
printf "====================================\\n\\n"
# Output the first array in the desired format
echo '$terrain_types: ('; # Use single quotes here
# Loop through each element in the array
for i in "${!terrain_types[@]}"; do
    # Check if the current element is the last one
    if [ $i -eq $((${#terrain_types[@]} - 1)) ]; then
        # If yes, print it without a comma
        printf "%s\n" "${terrain_types[$i]}"
    else
        # If not, print it with a comma
        printf "%s,\n" "${terrain_types[$i]}"
    fi
done
echo ");";

printf "\\n\\n"

printf "Terrain types to be updated under map-setup.lua\\n"
printf "====================================\\n\\n"

# Output the second array in the desired format
echo 'terrainTypes = {';
# Loop through each element in the array
for i in "${!terrain_names[@]}"; do
    # Check if the current element is the last one
    if [ $i -eq $((${#terrain_names[@]} - 1)) ]; then
        # If yes, print it without a comma
        printf "\t%s\n" "${terrain_names[$i]}"
    else
        # If not, print it with a comma
        printf "\t%s,\n" "${terrain_names[$i]}"
    fi
done
echo "}";
