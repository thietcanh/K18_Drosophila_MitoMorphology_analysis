waitForUser("Select stack image");
stack = getTitle();
image = replace(stack, ".jpg", "");

imageTH = image + "_TH"

image_mito = image + "_mito"


run("Images to Stack", "use");
run("Specify...", "width=200 height=200 x=250 y=250 slice=1");
waitForUser("Select ROI", "Draw ROI to crop");
run("Crop");
run("Stack to Images");
savelink = getDirectory("Choose output");
selectWindow(image);
saveAs("Jpeg", savelink + image + " crop");
selectWindow(imageTH);
saveAs("Jpeg", savelink + imageTH + " crop");
selectWindow(image_mito);
saveAs("Jpeg", savelink + image_mito + " crop");
close("*");