#include Gdip_All.ahk

F3::

Send u

Sleep 1000

pToken := Gdip_Startup()

global = skipScreenshot

snap := Gdip_BitmapFromScreen("392|341|470|64")
Gdip_SaveBitmapToFile(snap, "Bin\member 1.bmp")

snap := Gdip_BitmapFromScreen("392|416|470|64")
Gdip_SaveBitmapToFile(snap, "Bin\member 2.bmp")

snap := Gdip_BitmapFromScreen("392|491|470|64")
Gdip_SaveBitmapToFile(snap, "Bin\member 3.bmp")

snap := Gdip_BitmapFromScreen("392|566|470|64")
Gdip_SaveBitmapToFile(snap, "Bin\member 4.bmp")

snap := Gdip_BitmapFromScreen("392|641|470|64")
Gdip_SaveBitmapToFile(snap, "Bin\member 5.bmp")

snap := Gdip_BitmapFromScreen("392|716|470|64")
Gdip_SaveBitmapToFile(snap, "Bin\member 6.bmp")

Sleep 1000


;check first person on the roster. If not you, screenshots guardian and ghost
;Sleep (in if statement) might need to be more to account for people with slower PCs

MouseMove, 890, 379
Sleep 500
PixelGetColor, color, 1000, 379
sleep 100
Send {Click Right}
Sleep 500
PixelGetColor, color2, 1000, 379
if(color != color2){
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 1.bmp")
    Sleep 100
    Send {Esc}
    Sleep 1500
}
else{
    Send i
    Sleep 500
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 1.bmp")
    Send u
    Sleep 1500
}

;second person
MouseMove, 890, 447
Sleep 500
PixelGetColor, color, 1000, 447
sleep 100
Send {Click Right}
Sleep 500
PixelGetColor, color2, 1000, 447
if(color != color2){
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 2.bmp")
    Sleep 100
    Send {Esc}
    Sleep 1500
}
else{
    Send i
    Sleep 500
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 2.bmp")
    Send u
    Sleep 1500
}

;third person
MouseMove, 890, 520
Sleep 500
PixelGetColor, color, 1000, 520
sleep 100
Send {Click Right}
Sleep 500
PixelGetColor, color2, 1000, 520
if(color != color2){
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 3.bmp")
    Sleep 100
    Send {Esc}
    Sleep 1500
}
else{
    Send i
    Sleep 500
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 3.bmp")
    Send u
    Sleep 1500
}

;fourth person
MouseMove, 890, 596
Sleep 500
PixelGetColor, color, 1000, 596
sleep 100
Send {Click Right}
Sleep 500
PixelGetColor, color2, 1000, 596
if(color != color2){
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 4.bmp")
    Sleep 100
    Send {Esc}
    Sleep 1500
}
else{
    Send i
    Sleep 500
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 4.bmp")
    Send u
    Sleep 1500
}

;fifth person
MouseMove, 890, 667
Sleep 500
PixelGetColor, color, 1000, 667
sleep 100
Send {Click Right}
Sleep 500
PixelGetColor, color2, 1000, 667
if(color != color2){
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 5.bmp")
    Sleep 100
    Send {Esc}
    Sleep 1500
}
else{
    Send i
    Sleep 500
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 5.bmp")
    Send u
    Sleep 1500
}

;sixth person
MouseMove, 890, 740
Sleep 500
PixelGetColor, color, 1000, 740
sleep 100
Send {Click Right}
Sleep 500
PixelGetColor, color2, 1000, 740
if(color != color2){
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 6.bmp")
    Sleep 100
    Send {Esc}
    Sleep 1500
}
else{
    Send i
    Sleep 500
    Send s
    Sleep 2000
    snap := Gdip_BitmapFromScreen("930|124|640|540")
    Gdip_SaveBitmapToFile(snap, "Bin\ghost 6.bmp")
    Send u
    Sleep 1500
}

;create bitmap and background
pBitmap := Gdip_CreateBitmap(1920, 1080)
G := Gdip_GraphicsFromImage(pBitmap)
pBrush := Gdip_BrushCreateSolid(0xff00ff00)
Gdip_FillRectangle(G, pBrush, 0, 0, 1920, 1080)
Gdip_DeleteBrush(pBrush)

;bitmap files
pBitmapGhost1 := Gdip_CreateBitmapFromFile("Bin\Ghost 1.bmp")
pBitmapGhost2 := Gdip_CreateBitmapFromFile("Bin\Ghost 2.bmp")
pBitmapGhost3 := Gdip_CreateBitmapFromFile("Bin\Ghost 3.bmp")
pBitmapGhost4 := Gdip_CreateBitmapFromFile("Bin\Ghost 4.bmp")
pBitmapGhost5 := Gdip_CreateBitmapFromFile("Bin\Ghost 5.bmp")
pBitmapGhost6 := Gdip_CreateBitmapFromFile("Bin\Ghost 6.bmp")

pBitmapMember1 := Gdip_CreateBitmapFromFile("Bin\Member 1.bmp")
pBitmapMember2 := Gdip_CreateBitmapFromFile("Bin\Member 2.bmp")
pBitmapMember3 := Gdip_CreateBitmapFromFile("Bin\Member 3.bmp")
pBitmapMember4 := Gdip_CreateBitmapFromFile("Bin\Member 4.bmp")
pBitmapMember5 := Gdip_CreateBitmapFromFile("Bin\Member 5.bmp")
pBitmapMember6 := Gdip_CreateBitmapFromFile("Bin\Member 6.bmp")

;draw bitmap (order: Ghost 1-6 > Member 1-6)
Gdip_DrawImage(G, pBitmapGhost1, 0, 0, 640, 540, 0, 0, 640, 540)
Gdip_DrawImage(G, pBitmapGhost2, 640, 0, 640, 540, 0, 0, 640, 540)
Gdip_DrawImage(G, pBitmapGhost3, 1280, 0, 640, 540, 0, 0, 640, 540)
Gdip_DrawImage(G, pBitmapGhost4, 0, 540, 640, 540, 0, 0, 640, 540)
Gdip_DrawImage(G, pBitmapGhost5, 640, 540, 640, 540, 0, 0, 640, 540)
Gdip_DrawImage(G, pBitmapGhost6, 1280, 540, 640, 540, 0, 0, 640, 540)

Gdip_DrawImage(G, pBitmapMember1, 0, 0, 470, 64, 0, 0, 470, 64)
Gdip_DrawImage(G, pBitmapMember2, 640, 0, 470, 64, 0, 0, 470, 64)
Gdip_DrawImage(G, pBitmapMember3, 1280, 0, 470, 64, 0, 0, 470, 64)
Gdip_DrawImage(G, pBitmapMember4, 0, 540, 470, 64, 0, 0, 470, 64)
Gdip_DrawImage(G, pBitmapMember5, 640, 540, 470, 64, 0, 0, 470, 64)
Gdip_DrawImage(G, pBitmapMember6, 1280, 540, 470, 64, 0, 0, 470, 64)

;save bitmap to file
Gdip_SaveBitmapToFile(pBitmap, "FinalImage.png")

Gdip_DisposeImage(snap)
Return

F4::
reload
return

F5::ExitApp