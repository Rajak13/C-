using System;

class Program
{
    // Exercise 1: GetFullName Method
    static string GetFullName(string firstName, string lastName)
    {
        if (string.IsNullOrEmpty(firstName)) return lastName;
        if (string.IsNullOrEmpty(lastName)) return firstName;
        return $"{firstName} {lastName}";
    }

    // Exercise 2a: Add Method
    static int Add(int x, int y)
    {
        return x + y;
    }

    // Exercise 2b: Recursive Factorial (calculation only)
    static int RecursiveFactorial(int n)
    {
        if (n < 0) throw new ArgumentException("Enter a positive number");
        if (n == 0 || n == 1) return 1; // base case
        return n * RecursiveFactorial(n - 1);
    }

    //Exercise 3: CalculateSum and PrintMultiples

    static int CalculateSum(int a, int b){
        return a + b;
    }

    static void PrintMultiples(int n){
        for(int i = 1; i<=5; i++) Console.WriteLine(n * i);
    }

    static void Main()
    {
        // GetFullName
        Console.WriteLine(GetFullName("", "Ansari"));

        // Add
        Console.WriteLine($"Sum of the numbers is: {Add(3, 7)}");

        // Recursive Factorial
        int number = 1;
        int factorialResult = RecursiveFactorial(number);

        if (number == 0 || number == 1)
            Console.WriteLine($"Factorial is {factorialResult} (because n = {number})");
        else
            Console.WriteLine($"Factorial of {number} is: {factorialResult}");

        // Another example for factorial
        number = 3;
        factorialResult = RecursiveFactorial(number);
        Console.WriteLine($"Factorial of {number} is: {factorialResult}");

        // CalculateSum and PrintMultiples
        int sum = CalculateSum(4,7);
        Console.WriteLine($"Sum of the numbers is: {sum}");

        PrintMultiples(5);
    }
}
