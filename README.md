### FinderMinusFree

Automates a tiny Finder mod that shortens the unnecessarily long item info for storage devices on the desktop.

#### Preview

###### Before

![](http://i.imgur.com/sio4ziW.png)

###### After

![](http://i.imgur.com/7KF2swY.png)

#### Usage

`sudo ./FinderMinusFree` for **34 GB, 12 GB**

`sudo ./FinderMinusFree " / ^0"` for **34 GB / 12 GB**

---

Restore Finder's default:

`sudo ./FinderMinusFree ", ^0 free"` for **34 GB, 12 GB free**

#### Download

See [Releases](https://github.com/inket/FinderMinusFree/releases)

#### Details

I created this command-line utility because I'm tired of manually re-applying the mod after each OS X update.

It only changes `/System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/Localizable.strings` and makes a backup of it at `/System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/Localizable_backup.strings`
