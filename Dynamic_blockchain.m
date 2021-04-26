
disp('1. Import the data from ready-made CSV file')
disp('2. Use EPANETCPA to import the data ')
Mode=input('Enter the Transaction type: ');

if (Mode==1)
    data1=csvread('.\Excel_files\Ctown.csv', 1,0);
    labelling=readtable('.\Excel_files\Ctown.csv');
    labels2=labelling.Properties.VariableNames;
    labels=labels2(1,2:end)
    bc.ID= labels;
else
    addpath('.\epanetCPA\')
    inpFilePath = './networks/Net1.inp';
    scenarioFolder = './scenarios/Net1/';
    cpaFilePath = 'attacks.cpa';
    noAttackCpaFile = 'no_attacks.cpa';
    exp_name = cpaFilePath(1:strfind(cpaFilePath,'.cpa')-1);
     % Similation without attacks (used for comparison).
    simul = EpanetCPA(inpFilePath, [scenarioFolder, noAttackCpaFile]); % 
    simul = simul.run();
    simul.outputResults('no_attacks');
    start_toolkit;
    d=epanet(inpFilePath);
    d.plot;

    data1=csvread('no_attacks.csv', 1,0);
    labelling=readtable('no_attacks.csv');
    labels2=labelling.Properties.VariableNames;
    labels=labels2(1,2:end)
    bc.ID= labels;
end 

bc=Blockchain
bc.Networksize=length(data1);
bc.Data=data1;
disp('1. PoW')
disp('2. PoT')
disp('3. PoA')
disp('4. PoV')
disp('5. PoAuth')

bc.Consensus_mech=input('Enter the number of Consensus mechanism= ');
bc.stake=randi([0,1],bc.Networksize,1);
obj.Data=data1;
disp('1. Transaction per timestamp (all sensors data at one-time interval)')
disp('2. Transaction per Sensor')
Trans_type=input('Enter the Transaction type: ');

if (Trans_type==1)
    for i=1:1:length(data1)
        bc.blockArray(i);
        m1=Miner(bc);
        transaction={sprintf('% 0.2f',data1 (i,:))}; 
        tic
        m1.mine(transaction)
        Miningtime(i)=toc;
    end
    for io=1:length(labels)
       filename=strcat('.\Storage\', string(labels(1,io)), '.txt');
       diary (string(filename))
    end
    clc;
    MM=sum(Miningtime);
    disp('The Total mining time =')
    disp(MM)
    figure
    grid on; 
    bar (Miningtime)
    xlabel('Transaction Number')
    ylabel('Mining Time')  
else
    timestamp_count=1; 
    [r2 c2]=size(data1);
    for j=1:c2-1
        for i=1:1:r2
        bc.blockArray(i);
        m1=Miner(bc);
        transaction={sprintf('%.6f',data1 (i,j))}; 
        tic
        m1.mine(transaction)
        Miningtime(i,j)=toc;
        
        filename=strcat('.\Storage\', string(labels(:,j)), '.txt');
        diary (string(filename))
        clc
       end
       timestamp(j)=timestamp_count+1;
    end 
    MM=sum(Miningtime);
    disp('The Total mining time =')
    disp(sum(MM))
    figure
    grid on; 
    bar (Miningtime)
    xlabel('Transaction Number')
    ylabel('Mining Time') 
end
for ii=1:1:bc.Networksize+1
    disp(bc.blockArray (ii))
end 