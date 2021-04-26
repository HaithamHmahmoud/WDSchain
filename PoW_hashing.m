	function [tf, obj] = PoW_hashing(obj, newBlock)

    
%     pause(0.01); % represents the random choice of the miner
     newHash = DataHash( strcat( newBlock.getCombined(), num2str(newBlock.nonce) ));
     if(strcmp(newHash(1:2),'00') && strcmp(newBlock.selfHash,newHash))
        tf = true;
     else
        tf = false;
        disp('failed to add this block to chain')
     end   
    end 