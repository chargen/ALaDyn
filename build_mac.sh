mkdir build_gcc ; cd build_gcc ; cmake .. -DCMAKE_C_COMPILER=/usr/local/Cellar/gcc/6.3.0_1/bin/gcc-6 -DCMAKE_CXX_COMPILER=/usr/local/Cellar/gcc/6.3.0_1/bin/g++-6 ; cmake --build . --target install ; cd ..
