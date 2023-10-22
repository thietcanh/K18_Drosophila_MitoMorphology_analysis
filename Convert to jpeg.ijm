function action_MoHinh(input, output, filename) {
	open(input + filename);
	
	run("Set Scale...", "distance=14.2857 known=1 unit=um global");
	run("Scale Bar...", "width=10 height=10 thickness=10 font=50 color=White background=None location=[Lower Right] horizontal bold overlay label");
	//Contrast TH
	Stack.setChannel(2);
	setMinAndMax(5, 36);
	//Contrast mito
	Stack.setChannel(1);
	setMinAndMax(3, 24);
	
	
	name_pic_1=getTitle;
	saveAs("jpeg", output + name_pic_1 + ".jpg");
	//run("Channels Tool...");
	Stack.setActiveChannels("01");
	saveAs("Jpeg", output + name_pic_1 + "_TH.jpg");
	//run("Channels Tool...");
	Stack.setActiveChannels("10");
	saveAs("Jpeg", output + name_pic_1 + "_mito.jpg");
}
dir = getDirectory("Choose LINE Directory ");
input = dir + "Output tiff/"
output = dir + "Output jpeg/"
setBatchMode(true); 
list = getFileList(input);
for (i = 0; i < list.length; i++){
        action_MoHinh(input, output, list[i]);
}