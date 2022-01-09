# n. Setup ccache (must have if you dont want to wait 8 - 9 hours to compile)

    Please search google for install, i just point some config to make it work when compile
        + Change .cache location
			mv ~/.cache /mnt/c/.ccache
			ln -s  /mnt/c/.ccache ~/.cache
        + Set ccache to ~/.bashrc
			export USE_CCACHE=1
			export CCACHE_DIR=/mnt/c/.ccache
			export CCACHE_TEMPDIR=/mnt/c/.ccache

        + Some information if you want to know more 
        https://github.com/LeCmnGend/scripts/blob/master/ccache-config.sh
   
# n-1. Setup personal environment


