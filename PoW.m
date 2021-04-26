	function [tf, obj] = PoW(obj, newBlock)

     funcs = {@PoW_hashing} ;    
     arguments = {obj, newBlock} ; 

     for COunt=1:obj.Networksize%395
        funcs{1,COunt} =  @PoW_hashing ;
        arguments{COunt, 1} = obj;
        arguments{COunt, 2} = newBlock;
     end 
       parfor ii = 1:obj.Networksize %Networksize
        tic 
        solution1(ii)=funcs{ii}(arguments{ii,:});
%         [solution1(ii), solution2(ii)]=funcs{ii}(arguments{ii,:});
        timing(ii)=toc;
       end
    [Y, I]=min(timing);    tf=solution1(I);
      I;
      obj.stake(I)=obj.stake(I)+1;
    end 