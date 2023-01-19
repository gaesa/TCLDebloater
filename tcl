#!/usr/bin/bash
function help() {
	printf "Script to remove TCL TV bloatware using adb\n\n"
	printf "Usage:\n"
	printf "  \e[1mtcl\e[0m \e[4mcommand\e[0m\n\n"
	printf "Available Commands:\n"
	printf "  %-10sShow help about this program\n" "help"
	printf "  %-10sList all installed user packages\n" "list"
	printf "  %-10sUninstall some useless user packages\n" "clean"
	printf "  %-10sDisable uncontrollable updates of system and software\n" "disable"
}

function error_handling() {
	printf "\nRun 'adb devices' to check your adb connection\n"
	printf "Run 'adb connect \e[4mip\e[0m' or 'adb connect \e[4mhostname\e[0m' to connect your TCL TV over wifi\n"
}

function check_connection() {
	if ! adb shell pm list packages --user 0 >/dev/null; then
		error_handling
		exit 1
	fi
}

function list() {
	check_connection
	adb shell pm list packages --user 0 | cut -d ':' -f 2 | tr -d '\r'
}

function clean() {
	check_connection
	local allapps=( "com.tcl.bootadservice" \
	"com.tcl.tshop" \
	"com.tcl.tvsmartalbum" \
	"com.xiaodianshi.tv.yst" \
	"com.tcl.wholenetsearch" \
	"com.android.providers.contacts" \
	"com.cibn.tv" \
	"com.hunantv.market" \
	"com.tcl.videocall" \
	"com.tcl.qiyiguo" \
	"com.tcl.usercenter" \
	"com.tcl.weixin" \
	"com.tcl.appmarket2" \
	"com.tcl.tliveplay" \
	"com.sohu.inputmethod.sogou.tv" \
	"com.tcl.convergehome" \
	"com.tcl.SmartTVHelp" \
	"com.tcl.MultiScreenInteraction_TV" \
	"com.TCL.MultiScreenInteraction_TV" \
	"com.ktcp.csvideo" \
	"com.kwai.tv.yst" \
	"com.golive.cinema" \
	"com.iflytek.xiri" \
	"com.iflytek.xiri.translate" \
	"com.iflytek.xiri.recorder.svc" \
	"com.iflytek.xiri2.hal" \
	"com.iflytek.mictest" \
	"com.tcl.vod" \
	"com.tcl.selfbuy" \
	"com.tcl.appreciate.art" \
	"com.audiocn.kalaok.tv" \
	"com.tcl.tv.jtq" \
	"com.huan.edu.lexue.frontend" \
	"com.hunantv.market" \
	"com.android.tcl.messagebox" \
	"com.tcl.c2dm.client" \
	"com.tcl.ffkaraoke" \
	"com.tcl.gamecenter" \
	"com.tcl.playskill" \
	"com.tcl.ffeducation" \
	"com.android.bluetooth" \
	"com.tencent.qqmusictv" )

	local tmp="$(mktemp)"
	(adb shell pm list packages --user 0 | cut -d ':' -f 2 | tr -d '\r') >"$tmp" 
	for (( i=0; i<${#allapps[@]}; i++ )); do
		if grep -qx "${allapps[$i]}" "$tmp"; then
			printf "\nUninstalling ${allapps[$i]}...\n"
			adb shell pm uninstall --user 0 "${allapps[$i]}"
		fi
	done
}

function disable() {
	check_connection
	local apps=( "com.tcl.bi" "com.snm.upgrade" "com.tcl.versionUpdateApp" "com.tcl.update" )
	local tmp="$(mktemp)"
	(adb shell pm list packages --user 0 | cut -d ':' -f 2 | tr -d '\r') >"$tmp"
	for (( i=0; i<${#apps[@]}; i++ )); do
		if grep -qx "${apps[$i]}" "$tmp"; then
			printf "\nDisabling ${apps[$i]}...\n"
			adb shell pm disable-user "${apps[$i]}"
		fi
	done
}

if [[ "$1" == "help" ]]; then
	help
elif [[ "$1" == "list" ]]; then
	list
elif [[ "$1" == "clean" ]]; then
	clean
elif [[ "$1" == "disable" ]]; then
	disable
else
	printf "\nError: unrecognized command 'tcl $@'\n"
	printf "Run 'tcl help' to get usage help\n"
fi
