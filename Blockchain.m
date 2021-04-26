classdef Blockchain <handle
    properties
	totalCount% is used to record the number of blocks
	blockArray% The object array is used to hold the blockchain
    Networksize% overall Network size
    Consensus_mech% Consensus Mechanism
    ID
    stake
    TF
    Data
    end
    methods
	function obj = Blockchain()
	    obj.blockArray =[ Block(0,'Genesis Block')];% The first genesis block is generated when the blockchain object is constructed
	    obj.totalCount = 1;
	    obj.calculateGensisBlockHash();% Calculate the hash of the genesis block
        obj.Networksize;
        obj.Consensus_mech;
        obj.ID;
        obj.stake;
        obj.TF;
        obj.Data;
	end
	function bc = getLatest(obj)                            
	    bc = obj.blockArray(end);
	end
	function calculateGensisBlockHash(obj) 
	    gb = obj.blockArray(1);
	    Opt.Method ='SHA-256';
	    Opt.Input   ='ascii';
	    str = strcat(num2str( gb.index),gb.data )% The calculation method is to use all the contents as strcat
	    gb.selfHash = DataHash( str, Opt);% then hash
	end
	function addBlock(obj,newBlock)% When the miner successfully'digs out' a block that meets the requirements
	    if obj.validateNewBlock(newBlock)% call this function
	       obj.blockArray(end+1) = newBlock;% Add this block to the blockchain
        end
	end
	function tf = validateNewBlock(obj,newBlock)  % Verify whether the newly added block meets the requirements
       
        if (obj.Consensus_mech==1)
         [tf, obj] = PoW (obj, newBlock);
        elseif (obj.Consensus_mech==2)
         [tf, obj] = PoT (obj, newBlock); 
         elseif (obj.Consensus_mech==3)
         [tf, obj]=PoA(obj, newBlock);
        elseif (obj.Consensus_mech==4)
         tf = PoV(obj, newBlock);
        elseif (obj.Consensus_mech==5)
         tf = PoAuth(obj, newBlock);
        else 
            disp('Inccorect choice of Consensus Mechanism')
             tf = false;
        end
    end
    end
end