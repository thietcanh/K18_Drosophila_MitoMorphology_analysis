function action_MoHinh(input, filename) {
	open(input + filename);
mt = getTitle();

//Set scale về đơn vị micron
run("Set Scale...", "distance=1 known=0.07 unit=micron global");
run("Duplicate...", "title=mito duplicate channels=1");

//Threshold sử dụng block =1.75, c-value = 5
run("2D Threshold", "subtract rolling=1.25 sigma enhance max=1.80 adjust gamma=0.80 method=[Weighted Mean] block=1.75 c-value=5 despeckle remove");

wait(500);
selectWindow("mito thresholded");
close("\\Others");
rename(mt);

//Phân tích 2D 
run("2D Analysis", "perform count total mean total_0 mean_0 mean_1 mean_2 branches total_1 mean_3 branch branch_0 mean_4 if=Count perform_0 area perimeter form aspect branches_0 total_2 mean_5 branch_1 branch_2 mean_6 longest mask=None mask_0=Mask second=None second_0=[Channel 2] third=None third_0=[Channel 3] =None to=None then=None");
wait(4000);
close();
}
//Chọn input
dir = getDirectory("Choose");
input = dir+"Output tiff/";
output = "D:/Results/";
savename = File.getNameWithoutExtension(dir);

//setBatchMode(true); 
list = getFileList(input);
Array.sort(list);
for (i = 0; i < list.length; i++){
        action_MoHinh(input, list[i]);
}
//Lưu kết quả
selectWindow("2D Analysis Data - per Cell");
saveAs("results", output + "2D per Cell/" + "2D " + savename + " - per Cell.csv");
run("Close");
selectWindow("2D Analysis Data - per Mito");
saveAs("results", output + "2D per Mito/" + "2D " + savename + " - per Mito.csv");
run("Close");
selectWindow("Log");
run("Close");
showMessage("Macro ended");