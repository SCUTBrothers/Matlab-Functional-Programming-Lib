# MATLAB Functional Programming 

## 0 Introduction

I learned functional programming firstly by using javascript, it's a programming paradigm where programs are constructed by applying and composing functions. Some concepts of function programmming, like high-order function, currying, pipe, is similar to the way of mathematical derivation. Those concepts are interesting for us to learn to improve skills of mathematical derivation on computer. 

Since matlab is a famous and easy programming tool for researcher to test algorithms or start some insteresting mathmatical modeling tasks, I want to implement some basic functional programming tool which can allow us manipulate vector easier and derivate math equation using functions more intuitive.

## 1 Array

Array is a class based on matlab oop(object oriented programming) feature, which is used to extend capabilities of vector in matlab.

You can declare a vector `[1, 2, 3]`, and use command `arr = Array([1, 2, 3])` to pack it as an Array instance.

Here are some instance methods of Array:

- forEach
- filter
- reduce
- map
- ...

### 1.1 input callback to instance method of Array

**eg**
1. input callback using function handle
```Matlab
    vec = [1, 2, 3];
    arr = Array(vec);
    callback = @reducer; % get function handle using @ + <function name>
    sum = arr.reduce(callback);
    disp(sum); % 6

    % define callback with required formal parameter
    function res =  reducer(accumulator, currentValue, index, thisArr)
       res = accumulator + currentValue; 
    end
```

2. input callback using anoymous function
```Matlab
    vec = [1, 2, 3];
    arr = Array(vec);
    callback = @(currentValue, index, thisArr) currentValue < 3; 
    newArr = arr.filter(callback);

    disp(newArr.value); % [1, 2]
```
