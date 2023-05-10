import os
import re

# Get the current directory
current_dir = os.getcwd()

# Loop through all the files and folders in the directory
for root, dirs, files in os.walk(current_dir):
    for file in files:
        # Check if the file is called 'map.xml'
        if file == 'map.xml':
            # Open the XML file and read its contents
            with open(os.path.join(root, file), 'r') as f:
                xml_contents = f.read()
            
            # Remove newline characters and extra spaces between elements
            xml_contents = re.sub(r">\s+<", "><", xml_contents)

            # Write the new, one-line XML back to the file
            with open(os.path.join(root, file), 'w') as f:
                f.write(xml_contents)
                
            print(f"Converted {os.path.join(root, file)} to one line with a maximum of one space between elements.")
