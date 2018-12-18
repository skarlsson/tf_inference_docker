wget -O abseil.tar.gz "https://github.com/abseil/abseil-cpp/archive/20180600.tar.gz" && \
mkdir -p abseil && \
tar \
  --extract \
  --file abseil.tar.gz \
  --directory abseil \
  --strip-components 1 && \
cd abseil &&
mkdir build && cd build && \
cmake  -DCMAKE_BUILD_TYPE=Release -DENABLE_TESTING=OFF -DBUILD_SHARED_LIBS=ON .. && \
make -j "$(getconf _NPROCESSORS_ONLN)" && \

sudo cp ./absl/strings/libabsl_strings.a /usr/local/lib
sudo cp ./absl/base/*.a /usr/local/lib
sudo cp ./absl/numeric/*.a /usr/local/lib
sudo cp ./absl/container/*.a /usr/local/lib
sudo cp ./absl/synchronization/*.a /usr/local/lib
sudo cp ./absl/debugging/*.a /usr/local/lib
sudo cp ./absl/time/*.a /usr/local/lib
sudo cp ./absl/types/*.a /usr/local/lib
cd ..
sudo cp -r absl /usr/local/include

cd .. && \
rm abseil.tar.gz && \
rm -rf abseil






