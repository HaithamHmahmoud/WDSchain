% EPANET-Matlab WDSchain v1.0:
%
%       This tool provides a platform to simulate blockchain with several 
%       consensus mechanisms with WDS data from EPANET file.
%       This file shall accept any WDS EPANET file (*.inp).
%       The data imported from EPANET to MATLAB using EPANET-MATLAB Toolkit. 
  
%       Licence:
%       Copyright 2020 H2020 IOT4win Research Project (iot4win-itn.eu),
%       Birmingham City University (BCU), UK. 
%       Developed by: Haitham Mahmoud (ESR3), 
%                     Prof. Wenyan Wu,
%                     Dr. Yonghao Wang
%       You may not use this work except in compliance with the Licence.
%
clear all, close all, clc; 
disp('1. Static blockchain (One-time interval from EPANET )')
disp('2. Dynamic blockchain (Time-series data from excel files extracted from EPANET )')
Blockchain_type=input ('Enter the number of Blockchain= ')
if Blockchain_type==1
    Static_blockchain
else
    Dynamic_blockchain
end 
    diary Blockchain_log.txt
