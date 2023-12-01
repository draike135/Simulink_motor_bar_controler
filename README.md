Simulink Motor Bar Controller
Overview
This repository presents a Simulink model and accompanying MATLAB script for controlling the position of the tip of a 90cm bar attached to a motor shaft. The control system integrates feedback from a potentiometer and strain gauge to ensure precise and efficient movement of the bar's tip.

System Description
The control system aims to move the tip of the 90cm bar from one point to another as quickly as possible while minimizing oscillations. The key components of the system include:

Motor: Drives the shaft connected to the bar.
Potentiometer: Provides feedback on the current position of the bar.
Strain Gauge: Offers additional feedback for enhanced control.
File Structure
Simulink_motor_bar_controller.slx: Simulink model for the motor control system.
matlab_script.m: MATLAB script for additional system configuration and analysis.
test_data/: Directory containing test data for simulation and analysis.
System Configuration
Open the Simulink_motor_bar_controller.slx file using MATLAB R2015a.
Configure the parameters of the motor, potentiometer, and strain gauge within the Simulink model.
Adjust control parameters for the desired performance characteristics.
MATLAB Script
The matlab_script.m file complements the Simulink model by providing additional functionality, such as data analysis, visualization, and system configuration.

Test Data
The test_data/ directory contains sample data that can be used to test and validate the performance of the control system.

Open the Simulink model (Simulink_motor_bar_controller.slx) and MATLAB script (matlab_script.m) using MATLAB R2015a.

Configure the system parameters and control settings according to your specific requirements.

Run simulations and analyze the results using the provided test data or collect new data as needed.
