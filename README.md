# Dpos-Bot

This script has the function to check if your server is UP and SYNCED with the network, otherwise a notification, trough telegram (down or not synced) or trough pushbullet (server down), will be sent.

Pre-Requirements:

```
sudo apt-get update && sudo apt-get install jq -y
wget https://raw.githubusercontent.com/gregorst3/Dpos-Bot/master/DposScript.sh
```
How to use this script:

This screen every 60 seconds should check if server is available and synced.

`nano DposScript.sh`

Modify the following:

```SRV=IPSERVER:PORT
MESSAGE="Server SERVERNAME Is not synced with the network"
MEX="Server SERVERNAME Is DOWN"
CHATID=CHATID
apiToken=TELEGRAMTOKEN

TITLE="ATTENTION"
ACCESS_TOKEN="PUSHBULLETTOKEN"`
Ctrl x + y
```
To start the script use 
```
screen bash DposScript.sh
```
If you use it for dpos with old core (<1.0) please uncomment from line 71 to 99 and put a # from line 33 to 66
