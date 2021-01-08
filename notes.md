# **Notes for programming in Dart**

## **Functions**

```
void main() {
    for(int i = 0; i < 5 ; i++>){
        print('hello $(i + 1)');
    }
}
```

You can give your functions any name, except for **main**, which is the first function that Dart + Flutter will executed when starting the app


Any function can take parameters when called in. 

Dart is a strongly and strictly typed programming language so you have to be clear about the types of data the arguments are, and what type of data is returned from functions.

When data types are not specified, then Dart assumes they're **dynamic types** of data, which means they will accept any value given. If possible, **avoid dynamic types**.

```
addNumber(num1, num2) {
    print(num1 + num2);
}

void main() {
    addNumber(1, 2);
}
```
For functions to return values, specify the type of data that should be returned. **If not specified, Dart assumes the function is of type void.**
```
double addNumber(double num1, double num2) {
    return num1 + num2;
}

void main() {
    print(addNumber(1, 2.6));
    print(addNumber(3.4, 2.6));
}
```

## **Data types**

* Text:
  * strings (`String`)
* Numbers: 
  * integers (`int`)
  * floats (`double`)


## **Variables & Objects**

When introduced, use the keyword **var** or the type of data the variable will store.

**var** infers that the variable will hold any type of data of any function that is called or any operation it holds.

```
double addNumber(double num1, double num2) {
    return num1 + num2;
}

void main() {
    var firstResult = addNumbers(2.3, 4.4);
    firstResult = addNumbers(2,3);
    // ...
    print(firstResult + 1);
    (addNumber(3.4, 2.6));
}
```

**Objects are data structures** - you find them in a lot of programming languages.

**In Dart, every value is an object**, even primitive values like text (= String) or numbers (= Integers and Doubles). But you also have more complex built-in objects (e.g. Lists of data) and you can build your own objects.

## **Classes**

A class allows you to define a blueprint for the objects utilized, based on which you can then create (“instantiate”) the objects.

```
class Person{
    String name = 'Jaz';
    int age = 22;
}
```

To instantiate an object of *Person*:

```
double addNumber(double num1, double num2) {
    return num1 + num2;
}

void main() {
    var p1 = Person();

    print(p1) // Will return 'Instance of p1'
    print(p1.age) // Will return 22

    print(addNumber(1, 2.6));
}
```

### **Constructors**

A constructor is a method (function) in a class that is executed only once, when an object of the class is declared. A constructor can receive arguments (parameters) that would be defined when the class is called.

The keyword `this` is used to refer to properties of the class inside a constructor.

```
class Person {
    String name;
    int age;

    Person(String name, int age){
        this.name = name;
        this.age = age;
    }
}
```
When a constructor exists in a class, none of the arguments declarated in the constructor are optional, which means when the class is called (a.k.a the object of the class type is instantiated), the values of such constructor arguments **need to be specified.**

```
class Person {
    String name;
    int age;

    Person(String name, int age){
        this.name = name;
        this.age = age;
    }
}

void main() {
    var p1 = Person('Jaz', 22);

    print(p1) // Will return 'Instance of p1'
    print(p1.age) // Will return 22
}
```
Besides using the syntax above, you can also use **named arguments**, by wrapping the constructor's arguments in curly braces. This makes the arguments inside the curly braces **optional values.**

```
class Person {
    String name;
    int age;

    Person({String name, int age}){
        this.name = name;
        this.age = age;
    }
}

void main() {
    var p1 = Person(name: 'Jaz', age: 22);
    var p2 = Person(age: 15, name: 'Macarena')
    print(p1.age) // Will return 22
    print(p2.name) // Will return Macarena 
}
```

#### **Tips & Tricks**

You can define default values for named arguments by using the syntax:

```
class Person {
    String name;
    int age;

    Person({String name, int age = 12}){
        this.name = name;
        this.age = age;
    }
}
```

You can add special annotations such as `@required` to make any named argument a required value when a function is called (whether it's a constructor or just any function in your code)

```
class Person {
    String name;
    int age;

    Person({@required String name, int age = 12}){
        this.name = name;
        this.age = age;
    }
}
```

Sometimes, you get certain data and you want to assign it to variables of your class, this is so common that you don't have to write all that code, instead you can get rid of your constructor body, add a semicolon after it and now just make sure that you use your variable or your property names up here:

```
class Person {
    String name;
    int age;

    Person({String name, int age = 12});
}
```

## **Widgets**

**Flutter is about widgets.** Every flutter app you build, is just a bunch of widgets.

A Widget is a UI block that you can see on the screen. It's a special type of object. So to create a widget, you need to create a class, that extends the `StatelessWidget` class or the `StatefulWidget` class from the package `package:flutter/material.dart` and implement the function `build()` that will executed when building the widget to be shown.
