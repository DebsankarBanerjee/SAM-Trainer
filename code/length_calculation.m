function [nlength,Lstart,Lend,Lcsum] = length_calculation(imbw,x_mid)


  %%%%%%%%%%%%%%%%%%% Calculation of cell length along x_mid  %%%%%%%%%%%

  er = 1E-4;
  flag = 0;
  Lstart = [];
  Lend = [];
  Lcsum = [];
  pp= 1;
  %ibwmid = imbw(:,x_mid);

  ibwmid=mean(imbw,2);

  ibwmid(end)=0;

  for kk=1:numel(ibwmid)		%%------- for 
  dum = ibwmid(kk); 

   if(dum>er && flag<er)
   Lstart(pp) = kk;
   flag = 1;
   end

   if(dum<er && flag>er)
   Lend(pp) = kk;
   flag = 0;
   pp = pp + 1;
   end

  end					%%------- for end


  %Lend

  %Lstart  

  nlength = Lend - Lstart ;

  

  for kk=1:numel(nlength) 		%%------- for 
  
  Lcsum(kk) = sum( nlength(1:kk) );

  end					%%------- for end
  
