# Matlab_scripts
 Collection of Matlab scripts developed during master thesis of wurmc

#### BT_validation_plot2.m
Script for validation of RSS values of e.g. Bluetooth, WLAN or Cellular networks. It plots the measured values of different distances to the sender including error bars.

#### Calibration_scatter.m
The script plots RSS values of the Spectrum Analyzer in dBm on the x-axis and RSS values of the smartphone in dBm on the y-axis to see if any patterns for a possible calibration exist.

#### confdelta.m
Script from Prof.Dr.Stefan Valentin to compute confidece deltas.

#### Handy_data_evaluation.nm
Script for the calculation of the average RSS value in dBm needed for Calibration_scatter.m.

#### positioning.m
Script for visualizing the possible delimitation between two point clouds of reference points. It uses the following equation: outerDist(x,y) - (maxInnerDist(x) + maxInnerDist(y)).

#### SA_data_evaluation_loop.m
Script to calculate the average RSS value of a Spectrum Analyzer measurement in dBm and display the measured values.

#### statistic_tests.m
Script to perform statistic tests on the measured data, e.g. KS-test, fitted histogram, empirical CDF and QQ-plot.

#### statistics_WLAN.m
Script to perform reduced statistic tests on measured WLAN data, e.g. plot a histogram and QQ-plot.
