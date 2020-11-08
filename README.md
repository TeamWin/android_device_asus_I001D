# Device Tree Asus ROG Phone II (ASUS_I001D)

The Asus ROG Phone II (codenamed _"ASUS_I001D"_) is a smartphone from Asus.
It was released in September 2019.

## Compile

First download omni-9.0 tree:

```
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
```
Then add this project to a new local manifest (.repo/local_manifests/<your-file-name.xml>: 

```xml
<project name="android_device_asus_I001D" path="device/asus/I001D" remote="TeamWin" revision="android-9.0" />
```

Now you can sync your source:

```
repo sync
```

To automatically make the twrp installer, you need to import this commit in the build/make path: https://gerrit.omnirom.org/#/c/android_build/+/33182/
and add @osm0sis' standard twrp_abtemplate repo to a local manifest as indicated below (followed by another `repo sync` to download the repo):

```xml
<project name="osm0sis/twrp_abtemplate" path="bootable/recovery/installer" remote="github" revision="master"/>
```

Finally execute these:

```
. build/envsetup.sh
lunch omni_I001D-eng 
mka recoveryimage 
```

To test it:

```
fastboot boot out/target/product/I001D/recovery.img
```