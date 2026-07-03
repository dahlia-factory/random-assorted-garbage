# this is optional, idk if it is always beneficial, but i have noticed a significant different in performance
# using this on intensive tasks, which is pretty much everything i do on this computer, so this is nice to just do automatically
sudo cpupower frequency-set -g performance

# feel free to comment these out. requires terminaltexteffects to be installed, it's just an inside joke amongst me and my friends
echo "LATENT YANG LOCATED. PRESS [CTRL]+C TO INITATE" | tte burn
echo "YANG INVIGORATED!!!!!" | tte spotlights

echo -e "CPU running at 100% power. \e[31mFull steam ahead.\e[0m";

# log file location :3
UPDATE_LOG="$HOME/.cache/startup_updates.log";
mkdir -p "$(dirname "UPDATE_LOG")";

# sync databases and check updates without locking pacman
# if updates, count the number...
if [ -n "$updates" ]; then
	count=$(echo "$updates" | wc -l)

	#tell them about it
	{
		echo -e "\e[35m~~! System Updates Available !~~\e[0m"
		echo -e "\e[35m~~! There are ($count packages) available for update at your leisure. :\e[0m"

		# use awk (a text formatter)
		# to print ($1) package name, ((2) old version ~~~> ($4) new version) 
		# input is piped from checkupdates using echo "$updates" 
		echo "$updates" | awk '{print} " -->" $1 " (" $2 " ~~~> " $4 ")"}'

		# all the love. peace in this world i love my tranny life
		echo -e "\e[32mHave an excellent day. One milky kiss :3\e[0m"
	} > "$UPDATE_LOG" # dump that ho in the update log

else 
	# we clear the log if the system is all good!\
	# we boolin, we chillin
	# as a by the way, \e[32m changes the color, \e[0m changes back to default terminal color so we don't stain nothin
	echo -e "\e[32mNo system updates available. Have a nice day!\e[31m ~ <3 ~ \e[0m"
	> "$UPDATE_LOG"
fi

