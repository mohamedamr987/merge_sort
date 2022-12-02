void mergeSort(List<int> arr, int f,  int l){
  if( f >=l){
    return;
  }

  int midPoint = (f+l) ~/ 2;

  mergeSort(arr, f, midPoint);
  mergeSort(arr, midPoint+1, l);
  merge(arr, f, l, midPoint);
}

void merge(List<int> arr, int f,  int l, int midPoint){
  int length = (l-f);

  int leftIterator = f;
  int rightIterator = midPoint+1;
  List<int> result =[];

  void addFromRight(){
    result.add(arr[rightIterator]);
    rightIterator++;
  }
  void addFromLeft(){
    result.add(arr[leftIterator]);
    leftIterator++;
  }
  for(int i = 0 ; i <= length ; i++){
    if(leftIterator > midPoint){
      addFromRight();
    }
    else if(rightIterator > l){
      addFromLeft();
    }
    else if(arr[leftIterator] < arr[rightIterator]){
      addFromLeft();
    }
    else{
      addFromRight();
    }
  }
  for(int i = 0; i <= length; i++){
    arr[i+f] = result[i];
  }
}
// here is the algorithm
void main(List<String> arguments) {
  List<int> testArray = [6, 5, 12, 10, 9, 1];
  print("Before sorting : $testArray");
  mergeSort(testArray,0,testArray.length-1);
  print("After sorting : $testArray");
}
