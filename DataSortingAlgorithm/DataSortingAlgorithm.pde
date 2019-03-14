//Seth Banker, Insertion Sort

//I included this in case I labeled it wrong.
//This sorting algorithm iterates through each element and compares the current element to the next element, if it is not in order they swap places.

//Array of ints that need to be sorted (It's 255 long because its gonna be used for colors)
int[] intsToSort = new int[255];

int scale = 3;//This is multiplied for rect size variables and the size of the screen is (scale * 255)

void setup(){
  //**NOTE** do NOT change the width, if you need to, it must be a multiple of 255 and the scale must be equal to that multiple.
  size(765, 400);
  
  frameRate(1000);//I don't expect it to keep up with this and it doesn't have to, I just want it to go as fast as possible.
  
  //**POPULATE ARRAY**
  //Assigning the appropiate element to it's own slot (this is used to generate the correct elements and save them.)
  for(int i = 0; i < 255; i++){
    intsToSort[i] = i;// 1:1 match, the current iterated number is equal to that same numbered element in the array
  }
  
  
  //**RANDOMIZE ARRAY**
  //Now Randomize these elements so we have something to sort. (This is just randomly selecting elements and swapping them)
  for(Integer i : intsToSort){
    
    int randomIndex = int(random(0, intsToSort.length));//Choose a random index number to select an element and swap it
    int valuePlaceHolder = intsToSort[randomIndex];//Save the randomly selected index value because it's gonna be overwritten soon.
    intsToSort[randomIndex] = intsToSort[i];//At the randomly selected index, make the value equal to the selected one
    
    //This is why we needed the placeholder
    intsToSort[i] =  valuePlaceHolder;//The current iterated element equals the randomly selected element
  }
  
  
}

void draw(){
  
  //Prioritizes the earliest reached element.
  sortInts();
  
  //Draw all the elements on the array as they are
  for(int i = 0; i < intsToSort.length; i++){
    noStroke();
    fill(intsToSort[i]);
    rect(i * scale, 0, 3, height);
  }
}

void sortInts(){
  //For every int that must be sorted...
  for(int i = 0; i < intsToSort.length; i++){
    
    //if the current element is less than the next element (A.K.A. is in the correct place.) and the int is not 255 (That means we reached the end of the array and if we continue then it's null exception time for you!)
    if(intsToSort[i] < intsToSort[i + 1]){
      
      print("Continuing at element " + str(i) + ".\n");//Print what element were on
      continue;//continue because nothing significant has happened
      
    }
    else
    //if current element is greater than the next element (A.K.A. not in order)
    if(intsToSort[i] > intsToSort[i + 1])
    {
      
      int placeHolder = intsToSort[i];//save what element were on otherwise we'll lose what value this element held.
      intsToSort[i] = intsToSort[i + 1];//The current element now equals the next element (This is why we saved it because it's being overwritten)
      intsToSort[i + 1] = placeHolder;//The next element now equals what the current element once was.
      print("Out of order at " + str(i + 1) + ". Starting from the beginning.\n");//print that the next element was out of order and we are now restarting the process
      
      //Had I not been using a loop this would have been a recursive function and it would have restarted right here.
      break;//**DO NOT REMOVE** this will break (as in destroy) the program.
      
    }
  }
}
