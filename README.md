# left-ventricular-volume-estimation
MATLAB-based script for estimation of left ventricular volume from 2D cardiac ultrasound

## Requirements
- MATLAB with standard toolboxes
- 2D Cardiac ultrasound video in mov format (MATLAB versions after 2017a on macOS no longer support .avi format)

Prior to running lvent.m ensure that videos are located in the accompanying directory with proper naming format.
Sample ultrasound videos are provided as follows:
Ultrasound videos: /left-ventricular-volume-estimation/[Sample Name].mov

Video samples are labeled according to their anatomical view.
For example: /left-ventricular-volume-estimation/Apical4chVolunteer.mov


## Pipeline
1. Initialize the process by running lvent.m
    * A prompt will appear displaying instructions
    ![]
   
   
2. Identify desired end diastole volume (EDV) and end systole volume (ESV) frames
    * Use the movie player window to play and pause the cardiac ultrasound video
    * Exit the movie player and type in the frame numbers
    
    
3. Draw the left-ventricle axes in both of the selected frames
    * Click and drag the two points of the floating line to the endocardial layers of the left ventricle


4. Automatic pixel to centimeter distance conversion


5. Left ventricular cavity volume calculation at EDV and ESV (Modified Simpson's Rule)


6. Stroke Volume (SV), Ejection Fraction (EF), and Cardiac Output (CO) calculated


#### Repeat the pipeline for Mitral, Papillary, Apex, and Long Axis 4 Chamber views


#### Output:
* Detailed overview of the calculations for all four views + comparisons to standard clinical measurement methods.

```
L-VENT LEFT VENTRICULAR CAVITY MEASUREMENT RESULTS:
The measured left ventricular cavity volume at end-diastole is 131.16 mL.
The measured left ventricular cavity volume at end-systole is 49.56 mL.
The calculated stroke volume is 81.6 mL.
The calculated ejection fraction is 62.21%.
The calculated cardiac output is 4.896 L/min.
CLINICAL MEASUREMENT RESULTS:
The left ventricular cavity volume at end-diastole is 128.25 mL.
The left ventricular cavity volume at end-systole is 48.72 mL.
The stroke volume is 79.53 mL.
The ejection fraction is 62%.
The cardiac output is 4.7718 L/min. The VTI cardiac output averaged between pulse and continuous wave is 4.03 L/min.
PHANTOM MEASUREMENT RESULTS:
The measured volume of the balloon is 595.9387 mL.
The actual volume of the balloon is 640 mL.
The percent error of the measured volume is 6.88%.
The percent error of the V3d volume is 15.78%.
The manual measurement is 8.9% closer to the true volume of the balloon than the V3d estimation.
MEASURED VALUES COMPARED TO CLINICAL VALUES:
The measured stroke volume is within 2.6% of the clinical value. The measured ejection fraction is within 0.34% of the clinical value. The measured cardiac output is within 2.6% of the clinical value.
```

## Acknowledgement
* Biomedical Engineering Department, School of Engineering and Applied Science, Columbia University, New York, NY
