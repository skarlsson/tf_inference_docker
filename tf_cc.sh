git clone https://github.com/skarlsson/tensorflow_cc.git -b master
cd tensorflow_cc/tensorflow_cc
mkdir build && cd build
cmake -DSYSTEM_PROTOBUF=ON ..
make -j "$(getconf _NPROCESSORS_ONLN)"
sudo make install
cd ../../..

#rm -rf tf_cc


#wget -O tensorflow_cc.tar.gz "https://github.com/FloopCZ/tensorflow_cc/archive/v1.12.0.tar.gz" && \
#mkdir -p tensorflow_cc && \
#tar \
#  --extract \
#  --file tensorflow_cc.tar.gz \
#  --directory tensorflow_cc \
#  --strip-components 1 && \
#cd tensorflow_cc/tensorflow_cc && \
#mkdir build && cd build && \
#cmake -DSYSTEM_PROTOBUF=ON .. && \
#make -j "$(getconf _NPROCESSORS_ONLN)" && \
#sudo make install && \
#cd ../../.. && \
#rm tensorflow_cc.tar.gz && \
#rm -rf tensorflow_cc



