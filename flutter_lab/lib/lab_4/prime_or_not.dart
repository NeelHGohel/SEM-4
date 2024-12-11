import 'dart:io';

void main(){
  stdout.write("Enter number 1 ");
  int n = int.parse(stdin.readLineSync()!);

  if(prime(n) ==1){
    print("Number $n is prime");
  }else{
    print("Number $n is not prime");
  }

}

int prime(int n){
  int count=0;
  for(int i =2 ; i < n ; i++){
    if(n%i == 0){
      count++;
    }
    if(count==0){
      return 1;
    }
  }
  return 0;
}