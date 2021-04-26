classdef Miner <handle
    properties
	blockchain% miner has a reference to the blockchain 
    end
    methods
	function obj = Miner(blockchain)
	    obj.blockchain = blockchain;
	end
	function mine(obj,newData)
	    % Get the last block on the current blockchain
	    latestBlock = obj.blockchain.getLatest();
	    %(1) is used to construct a newest block
	    % The required information is index, and the selfHash of the previous block is regarded as its previousHash
	    newBlock = Block( latestBlock.index+1 ,...
		newData,...
		latestBlock.selfHash);
	    % Violent solution method to find a selfHash that meets the requirements
	    not_found = true;
	    iter = 1;
	    Opt.Method ='SHA-256';
	    Opt.Input   ='ascii';
	    while(not_found)
		newHash = DataHash( strcat( newBlock.getCombined(), num2str(iter) ));                
		if( strcmp(newHash(1:2),'00'))
		    newBlock.nonce = iter;% (2) Violent solution 
		    newBlock.selfHash = newHash% if the assignment selfHash is found
		    obj.blockchain.addBlock(newBlock);% Add yourself to the blockchain
		    break
		end
		iter = iter + 1;
	    end
	end
    end
end