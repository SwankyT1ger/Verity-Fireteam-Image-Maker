SetWorkingDir, %A_ScriptDir%
#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
#include Gdip_all.ahk
pToken := Gdip_Startup()

if (!FileExist(A_ScriptDir "\Bin"))
    FileCreateDir, % A_ScriptDir "\Bin"

return

F3::
{
    InputBox, delay_time, Fireteam Image Maker, Input the amount of time to wait after inspecting a player.`nDefault: 2000`nIncrease this number if loading slowly.
    Send u
    Sleep 1000

    loop, 6
    {
        coords := (392 / 2560 * A_ScreenWidth) "|" ((341 + 75*(A_Index-1)) / 1440 * A_ScreenHeight) "|" (470 / 2560 * A_ScreenWidth) "|" (64 / 1440 * A_ScreenHeight)
        snap := Gdip_BitmapFromScreen(coords)
        image_name := "Bin\member " A_Index ".bmp"
        Gdip_SaveBitmapToFile(snap, image_name)
    }

    Sleep 1000

    selfie_taken := false
    num_guardians := 0
    loop, 6
    {
        Click, % (890 / 2560 * A_ScreenWidth) " " ((379 + 75*(A_Index-1)) / 1440 * A_ScreenHeight) " " 0
        Sleep 500
        PixelGetColor, color, % (1000 / 2560 * A_ScreenWidth), % ((379 + 75*(A_Index-1)) / 1440 * A_ScreenHeight) 
        sleep 100
        Send, {RButton}
        Sleep 500
        PixelGetColor, color2, % (1000 / 2560 * A_ScreenWidth), % ((379 + 75*(A_Index-1)) / 1440 * A_ScreenHeight) 
        coords := (930 / 2560 * A_ScreenWidth) "|" (124 / 1440 * A_ScreenHeight) "|" (640 / 2560 * A_ScreenWidth) "|" (540 / 1440 * A_ScreenHeight)
        if(color != color2){
            num_guardians++
            Send s
            Sleep, % delay_time
            snap := Gdip_BitmapFromScreen(coords)
            image_name := "Bin\ghost " A_Index ".bmp"
            Gdip_SaveBitmapToFile(snap, image_name)
            Sleep 100
            Send {Esc}
            Sleep 1500
        }
        else if (!selfie_taken) {
            num_guardians++
            Send {F1}
            Sleep 500
            Send s
            Sleep, % delay_time
            snap := Gdip_BitmapFromScreen(coords)
            image_name := "Bin\ghost " A_Index ".bmp"
            Gdip_SaveBitmapToFile(snap, image_name)
            Send u
            Sleep 1500
            selfie_taken := true
        }
        else 
            break
    }

    ;create bitmap and background
    FileDelete, FinalImage.png
    pBitmap := Gdip_CreateBitmap(1920, 1080)
    G := Gdip_GraphicsFromImage(pBitmap)
    pBrush := Gdip_BrushCreateSolid(0xff212121)
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

    loop, % num_guardians
    {
        ghost_name := "pBitmapGhost" A_Index
        member_name := "pBitmapMember" A_Index
        Gdip_DrawImage(G, %ghost_name%, Mod(A_Index-1, 3)*640, Floor((A_Index-1)/3)*540, 640, 540, 0, 0, (640 / 2560 * A_ScreenWidth), (540 / 1440 * A_ScreenHeight))
        Gdip_DrawImage(G, %member_name%, Mod(A_Index-1, 3)*640, Floor((A_Index-1)/3)*540, 470, 64, 0, 0, (470 / 2560 * A_ScreenWidth), (64 / 1440 * A_ScreenHeight))
    }

    ;save bitmap to file
    Gdip_SaveBitmapToFile(pBitmap, "FinalImage.png")
    Gdip_SetBitmapToClipboard(pBitmap)

    Gdip_DisposeImage(snap)
    MsgBox, Image Made
}
Return

F4::reload

F5::ExitApp
