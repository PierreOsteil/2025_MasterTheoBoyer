// prep the measurments
run("Set Measurements...", "area mean min centroid center stack redirect=None decimal=3");


// make a substack and split channels
run("Make Substack...", "channels=1-4 slices=100-200"); // if you need to subset your EB
imgName = getTitle(); // Obtenir le titre de l'image
selectImage(imgName);
run("Split Channels");

// Lefty1 channel (Channel 3)
selectImage("C3-"+imgName);
run("Duplicate...", "duplicate");
run("Subtract Background...", "rolling=10 stack");
setThreshold(400, 65535, "raw"); // treshshold at 400 for Lefty1
run("Convert to Mask", "background=Dark create");
run("Analyze Particles...", "size=10 pixel clear add stack");
run("Select All");
roiManager("Measure");
saveAs("Results", "C:/Users/piosteil/Desktop/Work/4-All_git/FISH_EB/data/_processed-04_C3.txt");

//Cer1 channel (Channel 2)
selectImage("C2-"+imgName);
run("Duplicate...", "duplicate");
run("Subtract Background...", "rolling=10 stack");
setThreshold(400, 65535, "raw"); // treshshold at 250 for Cer1
run("Convert to Mask", "background=Dark create");
run("Analyze Particles...", "size=10 pixel clear add stack");
run("Select All");
roiManager("Measure");
saveAs("Results", "C:/Users/piosteil/Desktop/Work/4-All_git/FISH_EB/data/_processed-04_C2.txt");

// GATA6 Channel (Channel 1)
selectImage("C1-"+imgName);
run("Duplicate...", "duplicate");
run("Subtract Background...", "rolling=10 stack");
setThreshold(400, 65535, "raw"); // treshshold at 250 for Cer1
run("Convert to Mask", "background=Dark create");
run("Analyze Particles...", "size=10 pixel clear add stack");
run("Select All");
roiManager("Measure");
saveAs("Results", "C:/Users/piosteil/Desktop/Work/4-All_git/FISH_EB/data/_processed-04_C1.txt");