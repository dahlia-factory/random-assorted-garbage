sudo cpupower frequency-set -g performance

# DISGUSTING bit i found online. alternates colors for each letter to make a gradient 
echo -e "\e[38;5;117mt\e[38;5;217mr\e[38;5;15ma\e[38;5;117mn\e[38;5;217ms \e[38;5;15mr\e[38;5;117mi\e[38;5;217mg\e[38;5;15mh\e[38;5;117mt\e[38;5;217ms \e[38;5;15ma\e[38;5;117mr\e[38;5;217me \e[38;5;15mh\e[38;5;117mu\e[38;5;217mm\e[38;5;15ma\e[38;5;117mn \e[38;5;217mr\e[38;5;15mi\e[38;5;117mg\e[38;5;217mh\e[38;5;15mt\e[38;5;117ms\e[0m"

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

