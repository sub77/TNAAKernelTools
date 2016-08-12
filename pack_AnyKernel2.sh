#!/bin/bash
version=$1
device=$2
android_version="M"
folder="carbonM"


set -e

rm -rf AnyKernel2/system
rm -rf AnyKernel2/modules
rm -rf AnyKernel2/patch
mkdir -p AnyKernel2/system/etc
mkdir -p AnyKernel2/modules
mkdir -p AnyKernel2/patch
mkdir -p RELEASE/$device
rm -f AnyKernel2/TNAAInstaller.sh
rm -f AnyKernel2/zImage
cp -r ../$folder/out/target/product/$device/kernel AnyKernel2/zImage
cp -r ../$folder/out/target/product/$device/system/lib/modules AnyKernel2/

case $device in
    amami)
        # export assets_line='assert(getprop("ro.product.device") == "D5503" || getprop("ro.build.product") == "D5503" || getprop("ro.product.device") == "amami" || getprop("ro.build.product") == "amami" || getprop("ro.product.device") == "anami" || getprop("ro.build.product") == "anami" || abort("This package is for device: D5503,amami,anami; this device is " + getprop("ro.product.device") + "."););'
        device1="D5503"
        device2="amami"
        device3="anami"
        device4=""
        device5=""
    ;;
    sirius)
        # export assets_line='assert(getprop("ro.product.device") == "D6502" || getprop("ro.build.product") == "D6502" || getprop("ro.product.device") == "D6503" || getprop("ro.build.product") == "D6503" || getprop("ro.product.device") == "D6506" || getprop("ro.build.product") == "D6506" || getprop("ro.product.device") == "D6543" || getprop("ro.build.product") == "D6543" || getprop("ro.product.device") == "sirius" || getprop("ro.build.product") == "sirius" || abort("This package is for \"D6502,D6503,D6506,D6543,sirius\" devices; this is a \"" + getprop("ro.product.device") + "\"."););'
        device1="D6502"
        device2="D6503"
        device3="D6506"
        device4="D6543"
        device5="sirius"
    ;;
    z3)
        # export assets_line='assert(getprop("ro.product.device") == "D6602" || getprop("ro.build.product") == "D6602" || getprop("ro.product.device") == "D6603" || getprop("ro.build.product") == "D6603" || getprop("ro.product.device") == "D6633" || getprop("ro.build.product") == "D6633" || getprop("ro.product.device") == "D6643" || getprop("ro.build.product") == "D6643" || getprop("ro.product.device") == "z3" || getprop("ro.build.product") == "z3" || abort("This package is for device: D6602,D6603,D6633,D6643,z3; this device is " + getprop("ro.product.device") + "."););'
        device1="D6602"
        device2="D6603"
        device3="D6633"
        device4="D6643"
        device5="z3"
    ;;
    z3c)
        # export assets_line='assert(getprop("ro.product.device") == "D5803" || getprop("ro.build.product") == "D5803" || getprop("ro.product.device") == "D5833" || getprop("ro.build.product") == "D5833" || getprop("ro.product.device") == "z3c" || getprop("ro.build.product") == "z3c" || abort("This package is for device: D5803,D5833,z3c; this device is " + getprop("ro.product.device") + "."););'
        device1="D5803"
        device2="D5833"
        device3="z3c"
        device4=""
        device5=""
    ;;
    honami)
        # export assets_line='assert(getprop("ro.product.device") == "C6902" || getprop("ro.build.product") == "C6902" || getprop("ro.product.device") == "C6903" || getprop("ro.build.product") == "C6903" || getprop("ro.product.device") == "C6906" || getprop("ro.build.product") == "C6906" || getprop("ro.product.device") == "C6943" || getprop("ro.build.product") == "C6943" || getprop("ro.product.device") == "honami" || getprop("ro.build.product") == "honami" || abort("This package is for device: C6902,C6903,C6906,C6943,honami; this device is " + getprop("ro.product.device") + "."););'
        device1="C6902"
        device2="C6903"
        device3="C6906"
        device4="C6943"
        device5="honami"
    ;;
    castor)
        # assert(getprop("ro.product.device") == "SGP521" || getprop("ro.build.product") == "SGP521" || getprop("ro.product.device") == "SGP541" || getprop("ro.build.product") == "SGP541" || getprop("ro.product.device") == "SGP551" || getprop("ro.build.product") == "SGP551" || getprop("ro.product.device") == "castor" || getprop("ro.build.product") == "castor" || abort("This package is for device: SGP521,SGP541,SGP551,castor; this device is " + getprop("ro.product.device") + "."););
        device1="SGP521"
        device2="SGP541"
        device3="SGP551"
        device4="castor"
        device5=""
    ;;
    castor_windy)
        # assert(getprop("ro.product.device") == "SGP511" || getprop("ro.build.product") == "SGP511" || getprop("ro.product.device") == "SGP512" || getprop("ro.build.product") == "SGP512" || getprop("ro.product.device") == "castor_windy" || getprop("ro.build.product") == "castor_windy" || abort("This package is for device: SGP511,SGP512,castor_windy; this device is " + getprop("ro.product.device") + "."););
        device1="SGP511"
        device2="SGP512"
        device3="castor_windy"
        device4=""
        device5=""
    ;;
    sumire)
        device1="E6653"
        device2="E6603"
        device3="E6633"
        device4="E6683"
        device5="sumire"
    ;;
    suzuran)
        device1="E5823"
        device2="E5803"
        device3="suzuran"
        device4=""
        device5=""
    ;;
    *)
        echo "wrong Device specified. You set $device, it needs to be amami, sirius, z3, z3c, honami, castor, castor_windy, sumire or suzuran"
        exit 1
    ;;
esac

kernel_name=TNAA-Kernel-V$version-$android_version-$device

cat <<EOT>> AnyKernel2/TNAAInstaller.sh
device.name1=$device1
device.name2=$device2
device.name3=$device3
device.name4=$device4
device.name5=$device5
is.permissive=0
EOT

cd AnyKernel2
zip -r ../TNAA-Kernel-V$version-unsigned.zip *
cd ..
java -Xmx2048m -jar signing/signapk.jar -w signing/testkey.x509.pem signing/testkey.pk8 TNAA-Kernel-V$version-unsigned.zip TNAA-Kernel-V$version-false-signed.zip
rm -f TNAA-Kernel-V$version-unsigned.zip
signing/zipadjust TNAA-Kernel-V$version-false-signed.zip TNAA-Kernel-V$version-adjusted-unsigned.zip
rm -f TNAA-Kernel-V$version-false-signed.zip
java -Xmx2048m -jar signing/minsignapk.jar signing/testkey.x509.pem signing/testkey.pk8 TNAA-Kernel-V$version-adjusted-unsigned.zip RELEASE/$device/$kernel_name.zip
rm -f TNAA-Kernel-V$version-adjusted-unsigned.zip
echo "TNAA Kernel for $device Sucessfully Packed and Signed as $kernel_name"
