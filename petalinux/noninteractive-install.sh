#!/usr/bin/env expect
set timeout -1
set install_dir [lindex $argv 0]
set version [lindex $argv 1]

spawn ./petalinux-v$version.run --dir $install_dir
expect "Press Enter to display the license agreements"
send "\r"
expect "LICENSE"
send "q"
expect "*>*"
send "y\r"
expect "LICENSE"
send "q"
expect "*>*"
send "y\r"
expect "*Petalinux SDK has been installed to*"
send_user "auto install petalinux done\r"
send_user "wait several minutes to clean up\r"
exit
