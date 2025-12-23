void main(){
    print("This is dart basics file");
    var name = "Neuro app";
    print("Name is a variable with a value : $name");
    name="Neuro Technologies";
    final age =20;
    print("The age is final, meaning it can be set onece on runtime: $age");
    const pi =3.14;
    print("Compile time set constant: $pi");
    print("The name is changed : $name");

    int integer_count = 10;
    double double_count = 10.01;
    String course = "Flutter Batch 1";
    bool isBeginner = true;
    print(integer_count);
    print(double_count);
    print(course);
    print(isBeginner);

    if(integer_count<= 10){
      print("if you are seeing this statement, the value if integer_count is <= 10 and the if condition is true");
    } else {
      print("if you are seeing this statement, the value if integer_count is > 10 and the if condition is false");
    }

  
    for (int i=1;i<=5;i++) {
        print("For loop: $i");
    }

    
    int j=1;
    while(j<=5) {
      print("While loop: $j");
      j++;
    }

    int s=sum(45,45);
    print("The sum of the above two numbers is : $s");

    int f=fact(5);
    print("The factorial of 5 is : $f");

    bool pc=isprime(7);
    print("Is the number 7 prime?: $pc");
}//main

int sum(int x, int y){
    int z=x+y;
    return z;
}

int fact(int n){
    if(n<=1)
    return 1;
    else
    return n*fact(n-1);
}

bool isprime(int n){
    if(n<=1)
    return false;
    for(int i=2;i<=n/2;i++){
      if(n%i==0)
      return false;
    }
    return true;
}