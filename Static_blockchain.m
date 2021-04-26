% Importing Data From EPANET using EPANET2MATLAB toolkit
start_toolkit;
d=epanet('.\networks\Ctown.inp');
d.plot;
%Junctions data
data1=str2double(d.NodeTankNameID)
T1=1;
if length(d.NodeTankIndex)~=1
for T=1:length(d.NodeTankIndex)
   T2=d.NodeTankIndex(T)
   data2(T1)=d.NodeTankInitialLevel(T2)
   data3 (T1)=d.NodeTankMaximumWaterLevel(T2)
   T1=T1+1;
end
else 
    data2=0; 
    data3=0;
end 

SmallestDataSize=length(data2);

bc=Blockchain
bc.Networksize=SmallestDataSize;
disp('1. PoW')
disp('2. PoT')
disp('3. PoA')
disp('4. PoV')
disp('5. PoAuth')

bc.Consensus_mech=input('Enter the number of Consensus mechanism= ')
bc.ID=d.NodeNameID;
bc.stake=randi([0,1],length(bc.ID),1);

for i=1:1:SmallestDataSize
    bc.blockArray(i);
    m1=Miner(bc);
    transaction={sprintf('%.6f',data1 (i)), sprintf('%.6f',data2 (i)), sprintf('%.6f',data3 (i)) }; 
    tic;
    m1.mine(transaction);
    Miningtime(i)=toc;

    filename=strcat('.\Storage\', string(bc.ID(:,i)), '.txt');
    diary (string(filename))
    clc
    toc; 
end
%t=toc
MM=sum(Miningtime);
disp('The Total mining time =')
disp(MM)
for ii=1:1:SmallestDataSize%length(data1)
    disp(bc.blockArray (ii))
end
%     toc
figure
grid on; 
bar (Miningtime)
xlabel('Block Number')
ylabel('Mining Time')