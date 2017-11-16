-- Mechadonloader

-- Colors
local colors =
{
	white = Color.new(255,255,255),
	yellow = Color.new(255,205,66),
	red = Color.new(255,0,0),
	green = Color.new(55,255,0)
}

local pad = Controls.read()
local oldpad = pad
local latestPatch = "https://a.pomf.cat/hxockz.zip"

            
function main()
    Screen.refresh()
    Screen.clear(TOP_SCREEN)
    Screen.waitVblankStart()
    Screen.debugPrint(5,5, "Welcome to Mechadonloader for TDM: Dokodon Mystery Adventure!", colors.red, TOP_SCREEN)
    Screen.debugPrint(30,20, "Press A to Download latest version", colors.white, TOP_SCREEN)
    Screen.debugPrint(30,35, "Press X to Clear Contents of Patch Folder", colors.white, TOP_SCREEN)
    Screen.debugPrint(30,65, "Press START to Exit to HBL/Home Menu", colors.white, TOP_SCREEN)
    Screen.debugPrint(5,5, "Mechadonloader will download the latest version of the English Patch", colors.white, BOTTOM_SCREEN)
    Screen.debugPrint(5,20, "from GitHub and install it via LumaCFW's LayeredFS functionality.", colors.white, BOTTOM_SCREEN)
    Screen.debugPrint(5,35, "Please note that LumaCFW version 7.0 or higher is needed for LayeredFS", colors.white, BOTTOM_SCREEN)
    Screen.debugPrint(5,50, "and 'Game Patching' must be enabled in Luma's settings for the patch", colors.white, BOTTOM_SCREEN)
    Screen.debugPrint(5,65, "to work!", colors.white, BOTTOM_SCREEN)
end

main()
while true do
    pad = Controls.read()
    if Controls.check(pad,KEY_A) then
        Screen.refresh()
        Screen.clear(TOP_SCREEN)
        Screen.flip()
        Screen.debugPrint (30,20, "Downloading latest version...", colors.yellow, TOP_SCREEN)
        Network.downloadFile(latestPatch,"/TDMENG.zip")
        Screen.debugPrint(30,35, "Patch Downloaded! Unzipping...", colors.yellow, TOP_SCREEN)
        System.extractZIP("/TDMENG.zip",System.currentDirectory())
        Screen.debugPrint(30,50, "Success! Cleaning up...", colors.yellow, TOP_SCREEN)
        System.deleteFile("/TDMENG.zip")
        Screen.debugPrint(30,65, "All done! Press START to exit!", colors.green, TOP_SCREEN)
        while true do
            pad = Controls.read()
            if Controls.check(pad,KEY_START) then
                Screen.waitVblankStart()
                Screen.flip()
                System.exit()
            end
        end
    elseif Controls.check(pad,KEY_START) then
        Screen.waitVblankStart()
        Screen.flip()
        System.exit()
    end
end

