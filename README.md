# TrueImage_only

Little Powershell script to kill every Acronis process that is not related with the main function of True Image 2021, which is to make backups.

This is done by killing the unnecessary processes and renaming the executables to "<executable-name>_RENAME" so Acronis True Image can't automatically start them anymore.

I recommend turning off the protection inside True Image before executing this script (Open Acronis True Image 2021 -> PROTECTION -> "Turn off protection").
