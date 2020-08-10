# Python, OpenCV, and FFmpeg

[![Docker Build Status](https://img.shields.io/docker/build/jonathanfoster/python-opencv-ffmpeg)](https://hub.docker.com/r/jonathanfoster/python-opencv-ffmpeg)

Docker image with Python, OpenCV, and FFmpeg.

## Usage

    docker run -it jonathanfoster/python-opencv-ffmpeg python
    >>> import cv2
    >>> print(cv2.__version__)

## Supported tags and respective Dockerfile links

Images tagged with `:contrib` contain docker images built with [contrib modules](https://github.com/opencv/opencv_contrib/).

- `latest`
- `opencv-4.4.0`
- `opencv-4.1.0`
- `contrib-opencv-4.1.0`
- `opencv-4.0.1`
- `contrib-opencv-4.0.1`
- `opencv-4.0.0`
- `contrib-opencv-4.0.0`
- `opencv-3.4.2`
- `contrib-opencv-3.4.2`
- `opencv-3.4.1`
- `contrib-opencv-3.4.1`
- `opencv-3.4.0`
- `contrib-opencv-3.4.0`
- `opencv-3.3.0`
- `contrib-opencv-3.3.0`
- `opencv-3.2.0`
- `contrib-opencv-3.2.0`
