// prep the measurments
run("Set Measurements...", "area mean min centroid center stack redirect=None decimal=3");
threshFISH = 1300;

// make a substack and split channels
run("Make Substack...", "channels=1-4 slices=100-200"); // if you need to subset your EB
imgName = getTitle(); // Get the title of the current image
selectImage(imgName);
run("Split Channels");

// Lefty1 channel (Channel 3)
selectImage("C3-"+imgName);
run("Subtract Background...", "rolling=10 stack");
setThreshold(threshFISH, 65535, "raw"); // treshshold at 400 for Lefty1
run("Convert to Mask", "background=Dark create");
run("Analyze Particles...", "size=10 pixel clear add stack");
run("Select All");
roiManager("Measure");
saveAs("Results", "C:/Users/piosteil/Desktop/Work/4-All_git/2025_MasterTheoBoyer/FISH_EB/data/"+imgName+"_C3.txt");

//Cer1 channel (Channel 2)
selectImage("C2-"+imgName);
run("Subtract Background...", "rolling=10 stack");
setThreshold(threshFISH, 65535, "raw"); // treshshold at 400 for Cer1
run("Convert to Mask", "background=Dark create");
run("Analyze Particles...", "size=10 pixel clear add stack");
run("Select All");
roiManager("Measure");
saveAs("Results", "C:/Users/piosteil/Desktop/Work/4-All_git/2025_MasterTheoBoyer/FISH_EB/data/"+imgName+"_C2.txt");

// GATA6 Channel (Channel 1)
selectImage("C1-"+imgName);
run("Subtract Background...", "rolling=10 stack");
setThreshold(400, 530, "raw"); // treshshold at 400 for GATA6
run("Convert to Mask", "background=Dark create");
run("Analyze Particles...", "size=10 pixel clear add stack");
run("Select All");
roiManager("Measure");
saveAs("Results", "C:/Users/piosteil/Desktop/Work/4-All_git/2025_MasterTheoBoyer/FISH_EB/data/"+imgName+"_C1.txt");


// DAPI Channel (Channel 4)
selectImage("C4-"+imgName);
run("Gaussian Blur...", "sigma=50 stack");
//run("Threshold...");
setThreshold(700, 65535, "raw"); 
setOption("BlackBackground", false);
run("Convert to Mask", "background=Light create");
run("Analyze Particles...", "size=1000-Infinity clear add stack");
run("Select All");
roiManager("Measure");
saveAs("Results", "C:/Users/piosteil/Desktop/Work/4-All_git/2025_MasterTheoBoyer/FISH_EB/data/"+imgName+"_C4.txt");