//Macro for crop DA neurons clusters in adult flies

function Crop(input, output, filename) {
	open(input + filename);
	
j = true;
while (j) {
name=getTitle();

//Contrast tạm thời
	run("Duplicate...", "title=B&C duplicate");
	selectWindow("B&C");
	//Contrast TH
	Stack.setChannel(2);
	setMinAndMax(5, 36);
	//Contrast mito
	Stack.setChannel(1);
	setMinAndMax(3, 24);

//Crop DA neurons cluster

run("Specify...", "width=1000 height=1000 x=2500 y=1600 slice=1 constrain centered");
waitForUser("Draw ROI 1000x1000");
selectWindow(name);
run("Duplicate...", "title=D1 duplicate");
run("Restore Selection");
run("Crop");

//Select DA neurons and clear out side
run("Duplicate...", "title=D2 duplicate channels=2");
run("Duplicate...", "title=D3");
run("Add Specified Noise...", "standard=12");
run("Gaussian Blur...", "sigma=2");
imageCalculator("Divide create 32-bit", "D2", "D3");
wait(500);
selectWindow("Result of D2");
setAutoThreshold("Otsu dark");
Thr = getBoolean("Check threshold", "Yesssss!!!", "Nooooo!!!");
if (Thr){
	
}else{
	run("Threshold...");
	waitForUser("Threshold", "Set threshold manually");
}
run("Create Mask");
run("Median...", "radius=2");
run("Close-");
run("Fill Holes");
run("Open");
run("Analyze Particles...", "size=2000-Infinity show=Masks display exclude clear include summarize overlay add");
wait(1000);

//Clear outside
selectWindow("D1");
roiManager("Combine");
run("Clear Outside");
run("Select None");
run("Duplicate...", "title=D1-ClearOutside duplicate");
	//Contrast TH
	Stack.setChannel(2);
	setMinAndMax(5, 36);
	//Contrast mito
	Stack.setChannel(1);
	setMinAndMax(3, 24);
waitForUser("Draw ROI");
selectWindow("D1");
run("Restore Selection");
run("Clear Outside");
run("Select None");
selectWindow("D1");
rename("D"+name);
run("Duplicate...", "title=test duplicate");
rename("Test"+name);
	//Contrast TH
	Stack.setChannel(2);
	setMinAndMax(5, 36);
	//Contrast mito
	Stack.setChannel(1);
	setMinAndMax(3, 24);

	
//Save image
//waitForUser("Save As?", "OK?");
OK = getBoolean("Is this image OK?", "Okay", "Do it again");
if (OK) {

hemisphere = getBoolean("Hemisphere 1 or 2?", "Hemisphere 1", "Hemisphere 2");
if (hemisphere) {
	DA_Cluster = getBoolean("Hemisphere 1, DA Cluster?", "PPL1 cluster", "PPM3 cluter");
	if (DA_Cluster) {
		selectWindow("D"+name);
		saveAs("tiff", output + "PPL1_" + name);
	} else { 
		selectWindow("D"+name);
		saveAs("tiff", output + "PPM3_" + name);
	}
} else {
	DA_Cluster = getBoolean("Hemisphere 2, DA Cluster?", "PPL1 cluster", "PPM3 cluster");
	if (DA_Cluster) {
		selectWindow("D"+name);
		saveAs("tiff", output + "PPL1'_" + name);
	} else { 
		selectWindow("D"+name);
		saveAs("tiff", output + "PPM3'_" + name);
	}
}
//Close
selectWindow("Results");
run("Close");
selectWindow("ROI Manager");
run("Close");
selectWindow("Summary");
run("Close");
selectWindow(name);
close("\\Others");

j = getBoolean("Continue crop this image?");

} else {
selectWindow("ROI Manager");
run("Close");
selectWindow("Summary");
run("Close");
selectWindow(name);
close("\\Others");
j = true;
}

}
close();
}
input = getDirectory("Choose INPUT Directory ");
output = getDirectory("Choose OUTPUT Directory ");

list = getFileList(input);
Array.sort(list);
for (i = 0; i < list.length; i++) {
	Crop(input, output, list[i]);
}
showMessage("Macro ended");