function [imth,flagLastCell,flagLastCellDiv] = boundary_cell_extraction(CC,imth,end_centroid,nlength,L0,divf,n1,tt,flagLastCell,flagLastCellDiv)

%%-------------------------------------%%
%% 


  ncell = CC.NumObjects ;
  ch_end = n1-end_centroid

  if(ncell <= 1)		%---------- IF(1)
  imth = imth;
  return
  end

  if(tt == 1) 			%---------- IF(1)
  imth = imth;
  return
  end


  %---------------------- remove cells that reach open ends
  %---------------------- centroid ~ end - cell_length, cell intensity removed
  %---------------------- centriod_Y of each element/object checked if found to be near
  %                       open end then extracted by hand.

  s = regionprops(CC,'Centroid');
  cent = cat(1, s.Centroid);
  cent_y = cent(:,2);
  cent_y_sorted = sort(cent_y)

  c1 = cent_y_sorted(end-1)
  c2 = cent_y_sorted(end)

  l1 = nlength(end-1);
  l2 = nlength(end);

  lend0 = L0(end);

  endcell1 = ncell-1;
  endcell2 = ncell;

  
  %---------------------- end cell is above end line (c2 < ch_end), return

  if (c2 < ch_end)
  imth = imth;
  flagLastCell=0;			% flag to indicate end cell reaches channel end
  flagLastCellDiv=0;
  return
  end


  %---------------------- end cell is below end line (c2 > ch_end), return
 
  if (c2 > ch_end || flagLastCell==1)

  flagLastCell=1;			% flag to indicate end cell reaches channel end 
  
  for kk=1:ncell
  dum = cent_y(kk);			
  if(dum == c2)
  imth(CC.PixelIdxList{kk}) = 0;
  end
  end


  %imth(CC.PixelIdxList{endcell2}) = 0;
  
  if (l2 < divf*lend0 || flagLastCellDiv==1)
  
  flagLastCellDiv=1;

  for kk=1:ncell
  dum = cent_y(kk);			
  if(dum == c1)
  imth(CC.PixelIdxList{kk}) = 0;
  end
  end

  %imth(CC.PixelIdxList{endcell1}) = 0;
  end

  end

  


  








