	function [tf, obj] = PoT(obj, newBlock)
    length(obj.ID);
%     stake= rand(length(obj.ID),1);
%     stake=randi([0,length(obj.ID)],length(obj.ID),1);
    [value, MinerIndex] = maxk(obj.stake,1);
%     ReputationTable=zeros(length(stake), 1); ReputationTable(MinerIndex)=1;
    obj.stake(MinerIndex)=obj.stake(MinerIndex)+1;
    % locating specific miner may be hard to implement at the moment
    newHash = DataHash(strcat( newBlock.getCombined(), num2str(newBlock.nonce) ));
    if(strcmp(newHash(1:2),'00') && strcmp(newBlock.selfHash,newHash))
          tf = true;
    else
          tf = false;
          disp('failed to add this block to chain')
    end   
    end 