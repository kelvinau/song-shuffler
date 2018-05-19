$NUM_OF_DIGITS = 5
$MAX_DIGIT = "9"
# remove prefix 
$songs = Get-ChildItem ./songs | Where-Object {$_.Name -match "^\d+ "}
if ($songs -ne $null) {
    foreach ($song in $songs) {
        Move-Item -LiteralPath $song.FullName ("./songs/" + $song.Name.substring($NUM_OF_DIGITS+1))
    }
}

#add prefix
$songs = Get-ChildItem ./songs | Where-Object {$_.Name -notmatch "rename.ps1"}
if ($songs -ne $null) {
    foreach ($song in $songs) {
        $randomNum = (Get-Random ($MAX_DIGIT * $NUM_OF_DIGITS)).ToString("0" * $NUM_OF_DIGITS)
        Move-Item -LiteralPath $song.FullName ("./songs/" + $randomNum + " " + $song.Name)
    }
}
