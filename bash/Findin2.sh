# Get the list of files to search
$files = Get-ChildItem -Path "D:\" -Filter "*.txt"
 
# Create an empty array to store the results
$results = @()

# Enter parameters
$word1 = "search_word_1"
$word2 = "search_word_2"

# Iterate through each file
foreach ($file in $files) {
 
    # Get the contents of the file
    $fileContents = Get-Content $file.FullName
 
    # Search for the value in the file contents
    #$matches = Select-String -Pattern $word1 -InputObject $fileContents

    # Search for the multiple values in the file contents
    $matches = Select-String -Pattern "($word1.*$word2)|($word2.*$word1)" -InputObject $fileContents
 
    # If the value is found, add the file name to the results array
    if ($matches.Count -gt 0) {
        $results += $file.Name
    }
}
 
# Write the results to the console
Write-Host $results