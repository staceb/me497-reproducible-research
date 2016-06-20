---
title: Calibration report
author: Richard Layton
date: 2016-08-24
output:
  word_document:
    reference_docx: mystyles-01.docx
---



## Introduction

Calibrating a *load cell* (a sensor for measuring uniaxial force) yields two main results: a calibration equation relating output voltage (mV) to input force (lb); and an estimate of sensor accuracy as a percentage of full span. This report presents the test results for an Omega LCL-005 load cell calibrated following the ANSI/ISA procedure.

The load-cell setup is shown in Figure 1. A known weight is suspended from the eye-hook, causing the thin-beam load cell to deform. A Wheatstone bridge on the beam detects the deformation and produces a voltage output signal that is  recorded.

![Figure 1. Applying a force to the load cell using a precision weight](load-cell-setup.png)



The calibration data are shown in Table 1. These data comprise 17 observations over 3 up-down cycles. Per the ANSI standard, the test begins and ends at the same mid-cycle test point in the same direction. 


| observ| cycle| test_point|direction | input_lb| output_mV|
|------:|-----:|----------:|:---------|--------:|---------:|
|      1|     1|          3|up        |      2.5|      51.1|
|      2|     1|          4|up        |      3.5|      70.4|
|      3|     1|          5|up        |      4.5|      88.8|
|      4|     1|          4|dn        |      3.5|      69.4|
|      5|     1|          3|dn        |      2.5|      49.5|
|      6|     1|          2|dn        |      1.5|      30.7|
|      7|     1|          1|dn        |      0.5|       8.7|
|      8|     2|          2|up        |      1.5|      29.9|
|      9|     2|          3|up        |      2.5|      49.4|
|     10|     2|          4|up        |      3.5|      70.0|
|     11|     2|          5|up        |      4.5|      91.6|
|     12|     2|          4|dn        |      3.5|      69.0|
|     13|     2|          3|dn        |      2.5|      50.1|
|     14|     2|          2|dn        |      1.5|      30.8|
|     15|     2|          1|dn        |      0.5|      10.9|
|     16|     3|          2|up        |      1.5|      30.2|
|     17|     3|          3|up        |      2.5|      49.7|

 










