$imageUrl = "https://cdn.wallpapersafari.com/53/89/LefMat.png"
$imagePath = "$env:TEMP\wallpaper.jpg"
Invoke-WebRequest -Uri $imageUrl -OutFile $imagePath
Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
[Wallpaper]::SystemParametersInfo(20, 0, $imagePath, 3)
