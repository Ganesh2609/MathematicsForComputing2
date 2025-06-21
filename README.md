# Mathematics for Computing 2 - Signal Processing & Image Analysis

A comprehensive MATLAB project implementing fundamental signal processing and image analysis techniques including DCT-based compression, bandpass filtering, FFT analysis, and MRI image processing.

## Overview

This project demonstrates practical applications of mathematical concepts in digital signal processing and image analysis. It includes implementations of compression algorithms, filtering techniques, and frequency domain analysis methods commonly used in multimedia processing and medical imaging.

## Theory Background

### Discrete Cosine Transform (DCT)
The DCT is a widely used transform in image and audio compression due to its energy compaction properties. By converting spatial/temporal domain data to frequency domain, DCT allows selective removal of high-frequency components that contribute less to perceptual quality, enabling efficient compression.

### Fast Fourier Transform (FFT)
FFT provides an efficient method for computing the Discrete Fourier Transform, enabling frequency domain analysis of signals. This project uses FFT for spectral analysis and implements convolution through frequency domain multiplication.

### Bandpass Filtering
Bandpass filters allow signals within a specific frequency range to pass while attenuating frequencies outside this range. The implementation uses windowed sinc functions to design finite impulse response (FIR) filters.

## Project Structure

```
MathematicsForComputing2/
├── README.md
├── Bandpass filter/
│   └── bandpass_conv.m          # Bandpass filter implementation with FFT convolution
├── DCT Image and audio codecs/
│   ├── ImgCompress.m            # Image compression using 2D DCT
│   ├── AudCompress.m            # Audio compression using 2D DCT
│   └── Img/                     # Sample images for compression testing
│       ├── JJK2.jpg, JJK2 red.jpeg
│       ├── Q1.png, Q1 red.jpeg
│       ├── aot1.png, aot1 red.jpeg
│       ├── lena_gray.bmp, lena_gray red.jpeg
│       ├── lens_color.png, lens_color red.jpeg
│       └── rose.jpg, rose red.jpeg
├── MRI/
│   └── MRI.m                    # MRI image FFT analysis and reconstruction
└── Signal Filtering/
    └── signalfiltering.m.txt    # Signal filtering using frequency domain methods
```

## Features

### Image Compression (ImgCompress.m)
- Implements lossy compression using 2D DCT
- Supports both grayscale and RGB images
- Applies threshold-based coefficient quantization
- Processes color images by separating RGB channels
- Automatically saves compressed images with "_red" suffix

### Audio Compression (AudCompress.m)
- DCT-based audio compression algorithm
- Applies frequency domain thresholding for size reduction
- Maintains audio quality while reducing file size
- Supports various audio formats through MATLAB's audioread/audiowrite

### Bandpass Filter (bandpass_conv.m)
- Designs FIR bandpass filters using windowed sinc method
- Implements FFT-based convolution for efficient filtering
- Features impulse response extraction through deconvolution
- Includes white noise generation and spectral analysis
- Visualizes filter characteristics and performance

### MRI Analysis (MRI.m)
- Performs FFT analysis on medical images
- Demonstrates frequency domain representation of MRI data
- Reconstructs images using inverse FFT
- Provides visualization of original, FFT, and reconstructed images

### Signal Filtering (signalfiltering.m)
- Creates composite signals with multiple frequency components
- Implements frequency domain filtering techniques
- Demonstrates spectral analysis using FFT
- Applies high-pass filtering to remove unwanted frequencies

## Technical Implementation

### DCT Compression Algorithm
The compression process applies 2D DCT to transform image/audio data into frequency domain, then zeros out coefficients below a threshold value. This removes high-frequency components that contribute less to perceptual quality:

```matlab
Mat = dct2(double(img));
Mat(abs(Mat) < threshold) = 0;
compressed_img = uint8(idct2(Mat));
```

### FFT-Based Convolution
The bandpass filter uses FFT convolution for computational efficiency, especially with longer filter kernels:

```matlab
Y = fft(signal) .* fft(filter);
filtered_signal = real(ifft(Y));
```

### Deconvolution Method
The project implements frequency domain deconvolution to extract impulse responses from filtered signals, useful for system identification and filter analysis.

## Results and Applications

The implemented algorithms demonstrate significant compression ratios while maintaining acceptable quality for both images and audio. The bandpass filtering effectively isolates desired frequency bands, and the FFT analysis provides insights into signal frequency content. Sample compressed images in the Img folder show the trade-off between compression ratio and visual quality.

These techniques form the foundation of modern multimedia compression standards (JPEG, MP3) and are essential in medical imaging, telecommunications, and digital signal processing applications.