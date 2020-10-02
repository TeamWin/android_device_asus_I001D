# Device Tree Asus ZenFone 6 (ASUS_I01WD)

The Asus ZenFone 6 (codenamed _"ASUS_I01WD"_) is a smartphone from Asus.
It was released in May 2019.

## Compile

First download omni-9.0 tree:

```
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
```
Then add these string to .repo/manifests/remove.xml


Then add these projects to .repo/local_manifests/roomservice.xml (If you don't have it, you can add them to .repo/manifest.xml): 

```xml
<project name="TeamWin/android_device_asus_I01WD" path="device/asus/I01WD" remote="github" revision="android-9.0" />
```

Now you can sync your source:

```
repo sync
```

To auotomatic make the twrp installer, you need to import this commit in the build/make path: https://gerrit.omnirom.org/#/c/android_build/+/33182/

Finally execute these:

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch omni_I01WD-eng
mka adbd recoveryimage 
```

To test it:

```
fastboot boot out/target/product/I01WD/recovery.img
```

Kernel Source: https://github.com/LineageOS/android_kernel_asus_sm8150
