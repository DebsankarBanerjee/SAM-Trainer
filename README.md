# SAM-Trainer
A trainer for bacterial cell segmentation of images from mother machine experiments using Segmentation and Analysis of Mother machine data (SAM)
# Aims of the trainer :
  In SAM all the image files are kept in the directory "/im". Notice that in this case there are two sets of data there- a.tif, b.tif and x.tif, y.tif.
  The first set (a,b) is from [this work by Tanouchi et al](https://www.nature.com/articles/sdata201736) and the second set (x,y) is form experiment described in our [manuscript](https://www.biorxiv.org/content/10.1101/2020.10.01.322685v1). These two data sets are different in many ways and have intensity values that differ significantly. There are two versions of the code here- "SAM_ab.m" and "SAM_xy.m" designed for these two data sets with slightly different input parameters in the beginning of the codes. We want the user to identify these differences and correlate them with the intansity values in the data (use ImageJ for that).
  
# To run SAM for set 1:
	Open MATLAB in /code folder path
	Run the code >SAM_ab
# To run SAM for set 2:
	Open MATLAB in /code folder path
	Run the code >SAM_xy
# For new data files:
	All .tif files should be in /im folder
	Write the filenames in the file code/dataname for example: if the files in "im" folder are xy01_01.tif and xy01_02.tif then the dataname file should be
	
	xy01_01
	xy01_02
	
	Change the input parameters as required then run SAM_"user defined new name".m in the MATLAB console
# Results:
	The folder "plot" contains frames with segmentation
	The folder "data" contains the data files cell_id_*
	Data structure in cell_id_* 
	array : current_index // time@Birth // time@Division // length@Birth // length@Division // parent ID // index at division // position at division
 
 For additional details see our [manuscript](https://www.biorxiv.org/content/10.1101/2020.10.01.322685v1).
