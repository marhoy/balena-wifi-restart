#dbus-send --system --print-reply --reply-timeout=2000 \
#	--type=method_call \
#	--dest=org.freedesktop.systemd1 \
#	/org/freedesktop/systemd1 \
#	org.freedesktop.systemd1.Manager.RestartUnit \
#	string:NetworkManager.service \
#	string:replace

#dbus-send --system --print-reply --dest=org.freedesktop.systemd1 \
#	/org/freedesktop/systemd1 \
#	org.freedesktop.systemd1.Manager.RestartUnit \
#	string:"network-manager.service" string:"fail"

while true
do
	sleep 300
	if ! iwgetid &> /dev/null; then
		echo "Wi-Fi network is down, reloading kernel module"
		modprobe -r brcmfmac
		modprobe brcmfmac
	else
		echo "Wi-Fi network is up, all good"
	fi
done

