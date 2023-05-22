# Exif-PS
PowerShell/Windows PowerShell用、ExifタグおよびSystemDrawing.Imageタグの列挙値（emum）定義

Emum definitions for Exif and SystemDrawing.Image tags for PowerShell/Windows PowerShell.
## 使い方/How to Use
ドットソースでファイルを読み込む  

    . ./EXIFTags.ps1
    . ./GDIPImageTags.ps1
System.Drawing.Bitmapからプロパティを取得  

     $x=New-Object System.Drawing.Bitmap(".\Sample01.JPG")
     $x.PropertyItems | select  id, @{Name="TagName"; Expression={[EXIFTags]$_.Id} },@{Name='GDIPTagName'; Expression={[GDIPImageTag]$_.Id } } ,Value
    
 
  

## EXIFTags.ps1
Source Infomation  
CIPA DC-008-2023  
デジタルスチルカメラ用画像ファイルフォーマット規格 Exif 3.0  
Exchangeable image file format for digital still cameras: Exif Version 3.0  
https://www.cipa.jp/std/documents/download_j.html?CIPA_DC-X008-2023_J

## GDIPImageTags.ps1
Source Infomation  
Windows kit Gdiplusimaging.h  
https://learn.microsoft.com/ja-jp/windows/win32/gdiplus/-gdiplus-constant-image-property-tag-constants?redirectedfrom=MSDN
https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-constant-image-property-tag-constants?redirectedfrom=MSDN
