# WDSchain

Introduction:
WDSchain is an open-source object-oriented MATLAB® toolbox, it extends the EPANET features to simulate blockchain of the hydraulic data at sensing nodes or any other system asset (e.g., tanks, valves, pipelines). The developed toolbox can simulate two options; 1) static blockchain that adds static data (any one-time interval) of WDS into blockchain at a time, and 2) Dynamic blockchain, which establishes a chain of time-series data of a complete WDS. Five tailored consensus mechanisms for different-security-level (PoW, PoS, PBFT, PoA, and through-authentication) are developed for data verification.
Please cite the followed toolbox paper if you used this code for a publication.  

Requirements:
•	EPANET2.0 and EPANET2 Programmer's Toolkit can be downloaded from the EPA website (https://www.epa.gov/water-research/epanet). 
•	MATLAB: WDSchain has been tested on MATLAB 2014b, 2018a, and 2020a. Some MATLAB versions may require installing of MinGW-w64 C/C++ Compiler (https://uk.mathworks.com/matlabcentral/fileexchange/52848-matlab-support-for-mingw-w64-c-c-compiler) or from the MATLAB Add-ons library to invoke the DLLs files. 

Usage:
•	Execute the simulation from the ‘WDSchain.m’ file. The users shall be asked whether would like to use static or dynamic blockchain and with the needed consensus mechanism. 
•	To change the used Water Distribution System (WDS) modelling file in the static blockchain, Add the *.inp file in the networks folder and edit line 2 with the modelling name in ‘Static_blockchain.m’. In the dynamic blockchain, line 7 or lines 10-13 can be edited to change in ‘Dynamic_blockchain’ to import time-series data from excel file (*.csv) or from water modelling file (*.inp), respectively. 
•	For developers, other new consensus mechanisms can be further developed in new files and called after line 53 in the ‘blockchain.m’ with another if-else condition. 

License:
Copyright 2020 H2020 IOT4win Research Project (iot4win-itn.eu), Birmingham City University (BCU), U.K. It was developed by Haitham Mahmoud, Prof. Wenyan Wu, and Dr. Yonghao Wang. 
You may not use this work without citing this paper;
Email: Haitham.Mahmoud@bcu.ac.uk - Haithamhassanmahmoud@gmail.com

https://www.mdpi.com/2073-4441/13/14/1944

