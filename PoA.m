	function [tf, obj] = PoA(obj, newBlock)
%       [value, MinerIndex] = maxk(obj.stake,1);
%     ReputationTable=zeros(length(stake), 1); ReputationTable(MinerIndex)=1;
    RandNUM=randi([1,obj.Networksize],1,1);
    obj.stake(RandNUM)=obj.stake(RandNUM)+1;
    
%     pause(0.01); % represents the random choice of the miner
     newHash = DataHash( strcat( newBlock.getCombined(), num2str(newBlock.nonce) ));
     if(strcmp(newHash(1:2),'00') && strcmp(newBlock.selfHash,newHash))
        tf = true;
     else
        tf = false;
        disp('failed to add this block to chain')
     end   
    end 