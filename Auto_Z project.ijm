//global variable
var TH

function action_MoHinh(input, output, filename) {
	open(input + filename);
	TH=getTitle();
run("Subtract Background...", "rolling=50 stack");

run("Z Project...", "projection=[Max Intensity]");
}

function action_MoHinh2(input2, output, filename2) {
	open(input2 + filename2);
	mito=getTitle();
run("Subtract Background...", "rolling=20 stack");

run("Z Project...", "projection=[Max Intensity]");

//Đổi TH sang 8 bit
selectWindow("MAX_" + TH);
rename("redTH");
run("8-bit");
//contrast: setMinAndMax(5, 36);

//Đổi mito sang 8 bit
selectWindow("MAX_" + mito);
rename("mitoGFP");
run("8-bit");
//contrast: setMinAndMax(3, 24);

//Merge hình
run("Merge Channels...", "c2=mitoGFP c6=redTH create");
selectWindow("Composite");
saveAs("tiff", output + "Composite_" + TH + ".tif");

//Đóng tất cả cửa sổ
//waitForUser("Close all windows", "Close all?");
close();
close();
close();
}
input = getDirectory("Choose INPUT TH Directory ");
input2 = getDirectory("Choose INPUT Mito Directory ");
output = getDirectory("Choose OUTPUT Directory ");
setBatchMode(true);
list = getFileList(input+"/");
list2 = getFileList(input2+"/");
Array.sort(list);
Array.sort(list2);
Array.print(list);
Array.print(list2);
waitForUser("Test array", "OK?");
for (i = 0; i < list.length; i++){
        action_MoHinh(input, output, list[i]);
        action_MoHinh2(input2, output, list2[i]);
}
showMessage("Notification", "Macro ended");
