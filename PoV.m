	function tf = PoV(obj, newBlock)
         res=0;
           for COunt=1:obj.Networksize%395
                newHash = DataHash( strcat( newBlock.getCombined(), num2str(newBlock.nonce) ));
                if(strcmp(newHash(1:2),'00') && strcmp(newBlock.selfHash,newHash))
                    res=res+1;
                else 
                    res=res+0;
                end 
           end
           if ((res/obj.Networksize)>=0.6)
                     tf = true;
           else
                     tf = false;
           end  
    end 