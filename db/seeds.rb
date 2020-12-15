# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Quiz.create()
Quiz.create()
Quiz.create()

questions = [
    {codeQuestion:"What's the output?

    function sayHi() {
        console.log(name);
        console.log(age);
        var name = 'Lydia';
        let age = 21;
      }
      
      sayHi();",
    optionA: "A: Lydia and undefined",
    optionB: "B: Lydia and ReferenceError",
    optionC: "C: ReferenceError and 21",
    optionD: "D: undefined and ReferenceError",
    correctAnswer: "D: undefined and ReferenceError",
    explanation: "Within the function, we first declare the name variable with the var keyword. This means that the variable gets hoisted (memory space is set up during the creation phase) with the default value of undefined, until we actually get to the line where we define the variable. We haven't defined the variable yet on the line where we try to log the name variable, so it still holds the value of undefined.

Variables with the let keyword (and const) are hoisted, but unlike var, don't get initialized. They are not accessible before the line we declare (initialize) them. This is called the temporal dead zone. When we try to access the variables before they are declared, JavaScript throws a ReferenceError.",
      quiz: Quiz.all.sample
},

{   codeQuestion:"What's the output?

    const shape = {
    radius: 10,
    diameter() {
      return this.radius * 2;
    },
    perimeter: () => 2 * Math.PI * this.radius,
  };
  
  console.log(shape.diameter());
  console.log(shape.perimeter());",
    optionA: "A: 20 and 62.83185307179586",
    optionB: "B: 20 and NaN",
    optionC: "C: 20 and 63",
    optionD: "D: NaN and 63",
    correctAnswer: "B: 20 and NaN",
    explanation: "Note that the value of diameter is a regular function, whereas the value of perimeter is an arrow function.

With arrow functions, the this keyword refers to its current surrounding scope, unlike regular functions! This means that when we call perimeter, it doesn't refer to the shape object, but to its surrounding scope (window for example).

There is no value radius on that object, which returns NaN.",
    quiz: Quiz.all.sample
},

{codeQuestion:"Which one is true?
const bird = {
  size: 'small',
};

const mouse = {
  name: 'Mickey',
  small: true,
};",
    optionA: "A: mouse.bird.size is not valid",
    optionB: "B: mouse[bird.size] is not valid",
    optionC: "C: mouse[bird[size]] is not valid",
    optionD: "D: All of them are valid",
    correctAnswer: "A: mouse.bird.size is not valid",
    explanation: "In JavaScript, all object keys are strings (unless it's a Symbol). Even though we might not type them as strings, they are always converted into strings under the hood.

    JavaScript interprets (or unboxes) statements. When we use bracket notation, it sees the first opening bracket [ and keeps going until it finds the closing bracket ]. Only then, it will evaluate the statement.
    
    mouse[bird.size]: First it evaluates bird.size, which is -small-. mouse[`small`] returns true
    
    However, with dot notation, this doesn't happen. mouse does not have a key called bird, which means that mouse.bird is undefined. Then, we ask for the size using dot notation: mouse.bird.size. Since mouse.bird is undefined, we're actually asking undefined.size. This isn't valid, and will throw an error similar to Cannot read property -size- of undefined.",
    quiz: Quiz.all.sample
},

{codeQuestion:"What's the output?
let c = { greeting: 'Hey!' };
let d;

d = c;
c.greeting = 'Hello';
console.log(d.greeting);",
    optionA: "A: Hello",
    optionB: "B: Hey!",
    optionC: "C: undefined",
    optionD: "D: ReferenceError",
    correctAnswer: "A: Hello",
    explanation: "In JavaScript, all objects interact by reference when setting them equal to each other.
    
    First, variable c holds a value to an object. Later, we assign d with the same reference that c has to the object. When you change one object, you change all of them.",
    quiz: Quiz.all.sample
},

{codeQuestion:"What's the output?
    let a = 3;
    let b = new Number(3);
    let c = 3;

    console.log(a == b);
    console.log(a === b);
    console.log(b === c);",
    optionA: "A: true false true",
    optionB: "B: false false true",
    optionC: "C: true false false",
    optionD: "D: false true true",
    correctAnswer: "C: true false false",
    explanation: "new Number() is a built-in function constructor. Although it looks like a number, it's not really a number: it has a bunch of extra features and is an object.

    When we use the == operator, it only checks whether it has the same value. They both have the value of 3, so it returns true.
    
    However, when we use the === operator, both value and type should be the same. It's not: new Number() is not a number, it's an object. Both return false.",
    quiz: Quiz.all.sample
},

{codeQuestion: "What's the output?
class Chameleon {
  static colorChange(newColor) {
    this.newColor = newColor;
    return this.newColor;
  }

  constructor({ newColor = 'green' } = {}) {
    this.newColor = newColor;
  }
}

const freddie = new Chameleon({ newColor: 'purple' });
console.log(freddie.colorChange('orange'));",
    optionA: "A: orange",
    optionB: "B: purple",
    optionC: "C: green",
    optionD: "D: TypeError",
    correctAnswer: "D: TypeError",
    explanation: "The colorChange function is static. Static methods are designed to live only on the constructor in which they are created, and cannot be passed down to any children. Since freddie is a child, the function is not passed down, and not available on the freddie instance: a TypeError is thrown.",
    quiz: Quiz.all.sample
},

{codeQuestion:"What happens when we do this?

    function bark() {
      console.log('Woof!');
    }
    
    bark.animal = 'dog';",
    optionA: "A: Nothing, this is totally fine!",
    optionB: "B: SyntaxError. You cannot add properties to a function this way.",
    optionC: "C: Woof gets logged.",
    optionD: "D: ReferenceError",
    correctAnswer: "A: Nothing, this is totally fine!",
    explanation: "This is possible in JavaScript, because functions are objects! (Everything besides primitive types are objects)

    A function is a special type of object. The code you write yourself isn't the actual function. The function is an object with properties. This property is invocable.",
    quiz: Quiz.all.sample
},

{codeQuestion:"What's the output?

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

const member = new Person('Lydia', 'Hallie');
Person.getFullName = function() {
  return `${this.firstName} ${this.lastName}`;
};

console.log(member.getFullName());",
    optionA: "A: TypeError",
    optionB: "B: SyntaxError",
    optionC: "C: Lydia Hallie",
    optionD: "D: undefined undefined",
    correctAnswer: "A: TypeError",
    explanation: "In JavaScript, functions are objects, and therefore, the method getFullName gets added to the constructor function object itself. For that reason, we can call Person.getFullName(), but member.getFullName throws a TypeError.

    If you want a method to be available to all object instances, you have to add it to the prototype property:
    
    Person.prototype.getFullName = function() {
      return `${this.firstName} ${this.lastName}`;
    };",
    quiz: Quiz.all.sample
}

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

# {codeQuestion:"",
#     optionA: "",
#     optionB: "",
#     optionC: "",
#     optionD: "",
#     explanation: ""},

]

Question.create(questions)

