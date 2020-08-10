FROM python:3.8.5
MAINTAINER Jonathan Foster <jonathan@jonathanfoster.io>

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        ffmpeg \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install numpy

WORKDIR /
RUN OPENCV_VERSION="4.4.0" \
&& wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
&& unzip ${OPENCV_VERSION}.zip \
&& mkdir /opencv-${OPENCV_VERSION}/build \
&& cd /opencv-${OPENCV_VERSION}/build \
&& cmake -D BUILD_TIFF=ON \
  -D BUILD_opencv_java=OFF \
  -D WITH_CUDA=OFF \
  -D WITH_OPENGL=ON \
  -D WITH_OPENCL=ON \
  -D WITH_IPP=ON \
  -D WITH_TBB=ON \
  -D WITH_EIGEN=ON \
  -D WITH_V4L=ON \
  -D BUILD_TESTS=OFF \
  -D BUILD_PERF_TESTS=OFF \
  -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=$(python -c "import sys; print(sys.prefix)") \
  -D PYTHON_EXECUTABLE=$(which python) \
  -D PYTHON2_EXECUTABLE=$(which python2) \
  -D PYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -D PYTHON_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
  .. \
&& make install \
&& rm /${OPENCV_VERSION}.zip \
&& rm -r /opencv-${OPENCV_VERSION}
