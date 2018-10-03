#!/bin/bash
SRV=IP:PORT
MESSAGE="Server SERVERNAME Is not synced with the network"
MEX="Server SERVERNAME Is DOWN"
CHATID=
apiToken=

TITLE="ATTENTION"
ACCESS_TOKEN="PUSHBULLETTOKEN"

while true; do
	STATUSCODE=$(curl -w "%{http_code}" --silent --connect-timeout 10 --output /dev/null http://$SRV)


	if test $STATUSCODE -eq 000; 
	then 
			curl -s -u $ACCESS_TOKEN: -X POST https://api.pushbullet.com/v2/pushes --header 'Content-Type: application/json' --data-binary '{"type": "note", "title": "'"$TITLE"'", "body": "'"$MEX"'"}' >/dev/null 2>&1
	fi
	
	if test $STATUSCODE -eq 000; 
	then
	curl -s \
			-X POST \
			https://api.telegram.org/bot$apiToken/sendMessage \
			-d text="$MEX" \
			-d chat_id=$CHATID
			fi
	
	if test $STATUSCODE -eq 000; 
	then 
		exit 1
	fi



#Lisk core 1.0 
		#Thank you for the various tips to https://github.com/mrv777/LiskScripts/blob/master/check_height_and_rebuild.sh
	top_height(){
		HEIGHT=$(curl -s http://$SRV/api/peers | jq '.data[].height' | sort -nu | tail -n1)
	
		while [ -z "$HEIGHT" ]
		do
			sleep 1
				HEIGHT=$(curl -s http://$SRV/api/peers | jq '.data[].height' | sort -nu | tail -n1)
			done
	}

	local_height() {
		CHECKSRV=`curl -s "http://$SRV/api/node/status"| jq '.data.height'`
		while [ -z "$CHECKSRV" ]
		do
			sleep 1
			CHECKSRV=`curl -s "http://$SRV/api/node/status"| jq '.data.height'`
		done
		diff=$(( $HEIGHT - $CHECKSRV ))
		if [ "$diff" -gt "5" ]
		then
			curl -s \
			-X POST \
			https://api.telegram.org/bot$apiToken/sendMessage \
			-d text="$MESSAGE" \
			-d chat_id=$CHATID

		fi 

	}




#Old core < 1.0
#top_height(){
#        HEIGHT=$(curl -s http://$SRV/api/peers | jq '.peers[].height' | sort -nu | tail -n1)

#        while [ -z "$HEIGHT" ]
  #     do
    #            sleep 1
    #            HEIGHT=$(curl -s http://$SRV/api/peers | jq '.peers[].height' | sort -nu | tail -n1)
    #    done
#}

#local_height() {
 #       CHECKSRV=`curl -s "http://$SRV/api/loader/status/sync"| jq '.height'`
#        while [ -z "$CHECKSRV" ]
 #       do
 #       sleep 1
 #               CHECKSRV=`curl -s "http://$SRV/api/loader/status/sync"| jq '.height'`
#        done
#        diff=$(( $HEIGHT - $CHECKSRV ))
#        if [ "$diff" -gt "5" ]
#        then
     #           curl -s \
   #     -X POST \
  #      https://api.telegram.org/bot$apiToken/sendMessage \
  #      -d text="$MESSAGE" \
  #      -d chat_id=$CHATID
 #   fi

#}

			top_height
			local_height
			#comment if you don't want output
		date +"%Y-%m-%d %H:%M:%S || ${green}Local: $CHECKSRV, Highest: $HEIGHT"
		sleep 120
done

