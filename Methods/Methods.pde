
String folderPath = "testFolder/";

public void settings(){
 size(800,800); 
}

void setup(){
  background(255);
  //findFiles(string);
  findFiles(folderPath);//Is there files in target folder at start up?
  //numFiles(string);
  numFiles(folderPath);//How many files in target folder at start up?
}

Boolean findFiles(String argFilePath){
  File[] files = listFiles(argFilePath);//Attribute files in the sketch's folder to an array (this will be referenced as a number later).
  fill(0);//color text black
  
  //If number of files in the proposed folder path (folderPath) is greater than 0 (i.e. Files are in the folder.)
  //***NOTE*** if files.length == 3, it makes it look like a kissy face. I promise it's not.
  if(files.length > 0){
    text("Files have been found at " + "'" + argFilePath + "'", 0, 0, 500, 20);//Make a text box that shows how many files there are.
    return true;//return true because there is files
  }
  else
  {
    //If number of files is less than 1, (i.e. No files)
    text("No files could be found.", 0, 0, 200, 200);//Text box to show no files could be found.
    return false;//Since no files could be found return false.
  }
}

int numFiles(String argFilePath){
  File[] files = listFiles(argFilePath);//Attribute files in the sketch's folder to an array (this will be referenced as a number later).
  text(str(files.length) + " files have been found at " + "'" + argFilePath + "'", 0, 20, 500, 200);//Make a text box to show how many files were found at target folder.
  return files.length;//return number of files found
}
