echo "########################################################################"
echo "#                                                                      #"
echo "#			Moving to carbon build directory		     #"
echo "#                                                                      #"
echo "########################################################################"

cd ~/android/carbon

#Comment this out when this is solved, in the mean time, it will stay in the build command

echo "########################################################################"
echo "#                                                                      #"
echo "#		Making JAVA_LIBRARIES directory in out/...                   #"
echo "#		Moving org.cyanogenmod.platform.internal_intermediates to it #"
echo "#		This will fix compiler errors                                #"
echo "#                                                                      #"
echo "########################################################################"

mkdir out/target/common/obj/JAVA_LIBRARIES

cp -rf ../lineage/out/target/common/obj/JAVA_LIBRARIES/org.cyanogenmod.platform.internal_intermediates/ ./out/target/common/obj/JAVA_LIBRARIES/


echo "########################################################################"
echo "#									     #"
echo "#		Setting jack to build with 4gb...                            #"
echo "#                                                                      #"
echo "########################################################################"


export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"

./prebuilts/sdk/tools/jack-admin kill-server

./prebuilts/sdk/tools/jack-admin start-server


echo "########################################################################"
echo "#                                                                      #"
echo "#		Running envsetup.sh...                                       #"
echo "#                                                                      #"
echo "########################################################################"

. build/envsetup.sh


echo "########################################################################"
echo "#                                                                      #"
echo "#		Running lunch for ks01ltexx...				     #"
echo "#                                                                      #"
echo "########################################################################"

lunch carbon_ks01ltexx-userdebug

echo "########################################################################"
echo "#                                                                      #"
echo "#		Completed, now run make carbon -j 			     #"
echo "#                                                                      #"
echo "########################################################################"

