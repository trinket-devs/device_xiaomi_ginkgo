# n+1. Contact
	
	Feel free to contact https://t.me/IamBigN, 
	I hope i can help you solve your problems a bit
	
# n. Setup ccache (must have if you dont want to wait 8 - 9 hours to compile)

    Please search google for install, i just point some config to make it work when compile
        + Change .cache location (I use wsl2 on windows, install to D: (hdd) and i have to move cache and ccache dir to C: (ssd) )
			mv ~/.cache /mnt/c/.ccache
			ln -s  /mnt/c/.ccache ~/.cache
        + Set ccache to ~/.bashrc
			export USE_CCACHE=1
			CCACHE_MAXSIZE=50G
			export CCACHE_DIR=/mnt/c/.ccache
			export CCACHE_TEMPDIR=$CCACHE_DIR/tmp
			export CCACHE_LIMIT_MULTIPLE=0.97
			export CCACHE_LOGFILE=~/ccache-log.txt
			export CCACHE_SLOPPINESS=file_macro,time_macros,include_file_mtime,include_file_ctime,file_stat_matches	
			
        + Some information if you want to know more 
        https://github.com/LeCmnGend/scripts/blob/master/ccache-config.sh
   
# n-1. Setup personal environment


