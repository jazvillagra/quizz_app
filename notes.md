# Notes for programming in Dart

# Table of content

- [Notes for programming in Dart](#notes-for-programming-in-dart)
- [Table of content](#table-of-content)
  * [Functions](#functions)
  * [Data types](#data-types)
  * [Variables & Objects](#variables---objects)
  * [Classes](#classes)
    + [Constructors](#constructors)
      - [Tips & Tricks](#tips---tricks)
  * [Widgets](#widgets)
    + [Visible & Invisible widgets](#visible---invisible-widgets)
    + [Stateful vs Stateless widgets](#stateful-vs-stateless-widgets)
    + [Lifting states](#lifting-states)
  * [Public vs Private elements](#public-vs-private-elements)
  * [Containers](#containers)

## Functions

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

## Data types

* Text:
  * strings (`String`)
* Numbers: 
  * integers (`int`)
  * floats (`double`)
* Lists (`List<dataType> name = [...]`)


## Variables & Objects

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

## Classes

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

### Constructors

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

#### Tips & Tricks

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

## Widgets

**Flutter is about widgets.** Every flutter app you build, is just a bunch of widgets.

A Widget is a UI block that you can see on the screen. It's a special type of object. So to create a widget, you need to create a class, that extends the `StatelessWidget` class or the `StatefulWidget` class from the package `package:flutter/material.dart` and implement the function `build()` that will executed when building the widget to be shown.

### Visible & Invisible widgets

**Visible widgets** are related to user inputs and data outputs. These widgets are things like buttons, texts or cards. These widgets are drawned onto the screen.

**Invisible widgets** are the ones that help with layouts and controlling how the widget tree behaves and looks like, helping with the structure of the content on the application. These widgets are things like columns, rows, ListViews, etc.

Invisible widgets are shipped with Flutter, so we don't really have to build them ourselves

**The container() widget** kind of belongs into both categories, because it is invisible by default but you can also give it some styling so that it is visible and drawn into the screen.

Your object, so your classes, should always work standalone, so everything that belongs to a widget should go into **the same class**, all the data a widget uses and so on should belong into the same class so that the widget is a **standalone unit.**

### Stateful vs Stateless widgets

**Stateless widgets** cannot have state, hence, they are **static** widgets. These widgets are there specifically to output something, so we're only concerned with ouputting the data with certain styles, colors, structure, etc.

For example, `Text()` is a **stateless widget.**

**Stateful widgets** can have states, which means the data, structure and other things **can change** at any point in the application.

The difference between **stateless and stateful widgets** is that in a stateless widget, we have our widget and the build method which is used to render the UI. We can pass in data from outside into the stateless widget **through the constructor of that widget class, and this data can change (externally)**. Flutter would rebuild that widget when that external data changes, but **inside of the widget class, the data will never change**, we can only receive new data from outside and that will basically rebuild the widget.

Now, a stateful widget also has a build method that builds a widget and that renders a UI. But here, we can also get our input data, so data passed in through the constructor of the widget class, but we can also have some internal state, and that's the core thing here. This widget will get re-rendered, so the user interface will get updated by Flutter **whenever either that external or internal state changed.**

### Lifting states

Lifting the state up is when you manage the state on the common denominator of the different widgets that need this state (**parent widget**).

Just as we can pass text to a widget, we can also pass a pointer at a function to a widget.

## Public vs Private elements

As a default in Dart, every file is its own enclosed ecosystem, you could say it's own so-called library. These files can still work together with the help of **import statements**, but you can control what can be imported and what can be accessed in another file.

To inform Dart that an element should only be usable from inside the file it's located into, we **add a leading underscore in front of the name** and in all the places where we call this element (whether it's a class, method, property, etc.).

This might look like a cosmetic thing, but in reality, that leading underscore is a special syntax in Dart that **turns this element**, which is normally a **public element** (meaning it can be used in any file which imports it), **into a private element** and it can only be used/accessed from inside the file that contains it.

This same syntax should be applied to all properties and methods in a private class, to ensure that such elements are only accessible within the class itself.

## Containers

A container class is a convenience widget that combines common painting, positioning, and sizing of widgets.

The core of the container is always the child.

A container first surrounds the child with `padding` (inflated by any borders present in the decoration) and then applies additional constraints to the padded extent (incorporating the `width` and `height` as constraints, if either is `non-null`). The container is then surrounded by additional empty space described from the `margin`.

---

 <small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>