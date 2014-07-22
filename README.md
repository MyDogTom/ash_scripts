About
-----------
A collection of `ahk` scripts that I use every day.

Prerequisites
-----------
Installed [AutoHotkey](http://ahkscript.org/)
Usage
------
**One way**

Create main `ahk` file (eg. main.ahk) that `#include` all other scripts, that need to be used. This approach is used here.

**Another way**

Just copy code that you want to use to your `ahk` file
##Scripts Description

###main.ahk###

Illustrates usage of others scripts. Also have a hotkey win+c for action sequence: copy->open notepad++ -> open new file -> paste

###ChangeLayoutAndCopy.ahk
Fix the problem when text after being copied and pasted become unreadable. I saw this problem with cyrillic symbols. All that needs for fixing problem is change keyboard layout before copying. This scripts automates this. It takes keyboard layout id (0x401 for russian) as input parameter, changes keyboard layout before copying, copies (send wm_copy to active control), restores keyboard layout to initial one.

**usage**

Look in `main.ahk`

**known issues**

Doesn't work with browsers. (Probably due to usage of wm_copy) So you should use it only with specified applications.


###runFavoriteApps.ahk###
Hot keys for application that i offen use. For now it is `Total Commander` and `TheBat!`.

###CreatePatchFromFileList.ahk###
Very specific function. Use Total Commander and Notepad++. Selects all files with `sql` extension, copies full path names, opens new file in notepad and pastes copied pathnames. Also executes macro, that adds `@` in the beginning of each line and `"` in the beginning and ending of each line. This macro should be already exist in notepad++ and be accessible by `ctrl+alt+1` shortcut.




