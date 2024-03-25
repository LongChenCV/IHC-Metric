### Illumination Histogram Consistency Metric for Quantitative Assessment of Video Sequences

This is the official implementation of our IHC metric for quantitative assessment of video sequences
### Dependencies
Matlab
Python

### Data Download
We used 3D software Blender https://www.blender.org/ to generate 100 continuous video frames with linearly increasing
illumination. The simulated video frames can be downloaded from
https://1drv.ms/u/s!At3lDmLw-VwA2iLMCDxrk5miWksj?e=Cz5TYF


### Illumination Map Generation using the Retinex Model
Run the SSR algorithm using Matlab to produce the illumination maps
```
SSR_Code.m
```

### Histogram Geneation and IHC Computation
Run
```
python IHC_histogram.py
```

### Citation

This paper is under review now. If you use this code, please cite our paper later:

```
@InProceedings{IHC_2024,
    author    = {Long Chen, Mobarakol Islam, and Thomas Dowrick},
    title     = {Illumination Histogram Consistency Metric for Quantitative Assessment of Video Sequences},
}
```

### License

Licensed under the CC BY-NC-SA 4.0 license (https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode).
Copyright (C) 2024 NVIDIA Corporation.  All rights reserved.
Licensed under the CC BY-NC-SA 4.0 license (https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode).
These licenses allow you to use, modify and share the project for non-commercial use as long as you adhere to the conditions of the license above.

### Contact

If you have any questions, do not hesitate to contact us: ```chenlongcv@gmail.com```
