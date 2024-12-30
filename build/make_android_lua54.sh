export ANDROID_NDK=C:/MyFolder/ProjectSoftwares/android-ndk-r27c
export NDK=${ANDROID_NDK}

function build() {
    API=$1
    ABI=$2
    TOOLCHAIN_ANME=$3
    BUILD_PATH=build54.Android.${ABI}
    cmake -H. -B${BUILD_PATH} -DLUA_VERSION=5.4.1 -DANDROID_ABI=${ABI} -DCMAKE_BUILD_TYPE=Relase -DCMAKE_TOOLCHAIN_FILE=${NDK}/build/cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=${API} -DANDROID_TOOLCHAIN=clang -DANDROID_TOOLCHAIN_NAME=${TOOLCHAIN_ANME}
    cmake --build ${BUILD_PATH} --config Release
    mkdir -p plugin_lua54/Plugins/Android/libs/${ABI}/
    cp ${BUILD_PATH}/libxlua.so plugin_lua54/Plugins/Android/libs/${ABI}/libxlua.so
}

build android-18 armeabi-v7a arm-linux-androideabi-4.9
build android-18 arm64-v8a  arm-linux-androideabi-clang
build android-18 x86 x86-4.9
