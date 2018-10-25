# Carbon Five-specific environment settings

# Add Android SDK to $PATH
export ANDROID_SDK=$HOME/Library/Android/sdk
#
# required for Cleo-app
export PATH=$ANDROID_SDK/emulator:$PATH                                             

# Doesn't seem to be required 
# export PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platforms:$PATH

# Reference Java 8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home
