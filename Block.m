classdef Block <handle
% function Block_data = Block()
    properties
	index% block number
	data% transaction data
	previousHash% hash of the previous block 
	selfHash% own hash
	nonce% A random number will be explained later
    end   
    methods 
	function obj = Block(index,data,previousHash)% constructor
	    if nargin == 2% genesis block  
	      obj.index = index;
	      obj.data = data;             

	    elseif nargin == 3                     
	      obj.index = index;%input('enter block number');%index;
	      obj.data = data; %input('enter data value')%data;
	      obj.previousHash = previousHash;
          save Block
	     end
	end
       function str = getCombined(obj)% This function converts all data on the block except nonce and selfHash into characters.
					% Is then used to calculate selfHash
	    str = strcat(num2str( obj.index),obj.previousHash,strjoin(obj.data ));
       end

    end
     

end



