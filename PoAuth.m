function tf = PoAuth(obj, newBlock)
%        Authent=input('Enter Authentication ID= ')
       for oo=1:obj.Networksize
           tic
%           out = strcmp(Authent,obj.ID(oo))
          out = strcmp(obj.ID(oo),obj.ID(oo));

          if (out==1)
              tf=true;
              break;
          end
       end
end