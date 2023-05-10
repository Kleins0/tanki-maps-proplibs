# Define the target library name
$libraryName = "Bush 3D"

# Get all the XML files in the current directory and its subdirectories
$xmlFiles = Get-ChildItem -Path . -Recurse -Include "*.xml"

# Loop through each XML file and remove the target library trees
foreach ($xmlFile in $xmlFiles) {
    # Load the XML file into an XmlDocument object
    $xmlDoc = New-Object System.Xml.XmlDocument
    $xmlDoc.Load($xmlFile.FullName)

    # Find all the prop elements with the target library name
    $propElements = $xmlDoc.SelectNodes("//prop[@library-name='$libraryName']")

    # Loop through each prop element and remove it
    foreach ($propElement in $propElements) {
        [void]$propElement.ParentNode.RemoveChild($propElement)
    }

    # Save the updated XML back to the file
    $xmlDoc.Save($xmlFile.FullName)
}
