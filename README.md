Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Documented process in 'ma_process.md'
---------
* Full documentation of the steps taken to complete this project. Please read!!

**Things I can do to improve for future projects:**

Introduction
---------
This project is provided by Makers Academy. It is the first individual project given to students on completion of Week 1 of the course. It consolidates the skills taught during Week 1 in test-driven development and object-oriented programming.

The aim of this project is to write software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

The template for this this README file has been taken from [A Medium Corpo](https://medium.com/@meakaakka/a-beginners-guide-to-writing-a-kickass-readme-7ac01da88ab3).

Motivation
----------

The purpose of this project is to work of my weekly focus goals:

### I can TDD anything

Write a meaningful test. based on the user requirements. Write code using TDD to make the test pass.

### I can program fluently

Learn how to setup and structure a new Ruby project, and turn user requirements into working code.

### I can debug anything

Focus on specific techniques for uncovering the root-cause of bugs in your code.

### Specific goals

* Fully grasp the concept of TDD. Follow a clear structure and approach that can be applied to all projects.

* Develop understanding of RSpec functionality.

Build Status
---------

Complete:

* All user stories (specified in [ma_process.md](https://github.com/marbuthnott/airport_challenge/blob/master/ma_process.md)) have been fulfilled and pass green.

Working progress:

* Edge cases are still to be tested.

Tech/Framework Used
---------

This project will use Behaviour Driven Development (BDD) for Ruby with the RSpec testing language.

Code Style
--------

I will be checking my code conforms to the [Rubocop](https://github.com/rubocop-hq/rubocop) style guide.

How to use the airport program
---------

### 1. Getting Started

* Enter the interactive terminal by typing `irb` from the root of the airport_challenge directory.
* Once in the `irb`, type the following dependencies:

```
irb(main):001:0> require './lib/airport'
=> true
irb(main):002:0> require './lib/plane'
=> false
irb(main):003:0> require './lib/weather'
```

This allows access to the folders from within `irb`. The next step is to create your aiport.

### 2. Creating airports

* To create an airport, type in the following into your `irb`

```
irb(main):005:0> gatwick = Airport.new
=> #<Airport:0x00007fd44b8159d0 @plane_list=[], @weather=#<Weather:0x00007fd44b815958>, @capacity=5>
irb(main):006:0> london_city = Airport.new
=> #<Airport:0x00007fd44b24c4e0 @plane_list=[], @weather=#<Weather:0x00007fd44b24c4b8>, @capacity=5>
irb(main):007:0>
```

When an airport is created, it has a default capacity of 5, a list of planes (which is empty by default) and some information about the weather at the airport location (instantiated at random by the weather object).

You can create as many airports as you like!

### 3. How to change the airport capacity

If you do not provide a capacity when creating the airport, it will give you a default of 5. In order to set a capacity at the time of airport creation, do the following:

```
irb(main):012:0> stansted = Airport.new(Weather.new.stormy?, 15)
=> #<Airport:0x00007fd44b1b1008 @plane_list=[], @weather=false, @capacity=15>
irb(main):013:0>
```

In this example, you can see that Stansted airport has two arguments, `Weather.new.stormy?` and `15`, the first instantiates a new instance of weather and the second sets the airport capacity to 15 at the time of creation.

### 4. Creating a plane

* To create a plane, type the following into your `irb`

```
2.3.4 :009 > british_airways = Plane.new  
 => #<Plane:0x007faa2a887508>
2.3.4 :010 > air_france = Plane.new
 => #<Plane:0x007faa2a8777c0>
2.3.4 :011 >
```

### 5. Landing a plane

* To land a plane, type the following into your `irb`

```
2.3.4 :011 > heathrow.land(air_france)
 => [#<Plane:0x007faa2a8777c0>]
2.3.4 :012 >
```

air_france has now landed at heathrow! You can see the plane at the airport by typing the airport name again.

```
2.3.4 :012 > heathrow
 => #<Airport:0x007faa2b00a668 @capacity=2, @plane_list=[#<Plane:0x007faa2a8777c0>], @weather=#<Weather:0x007faa2b00a640>>
2.3.4 :013 >
```

### 6. Instructing a plane to take off

* To instruct a plane to take off, type the following into your `irb`

```
2.3.4 :014 > heathrow.take_off(air_france)
 => #<Plane:0x007faa2a887508>
2.3.4 :015 >
```

The plane has taken off from the airport and will no longer be included in the `plane_list`

### 7. Storms

* Sometimes, a message will appear to let you know that it is not safe to land or take off from the airport because it is stormy.

### 8. Reaching capacity

* If the `plane_list` has reached its capactiy (either set by you or at the default of 5) an error message will show. Can't have a crowded aiport!

### 9. Airport has no planes

* If the airport is not empty, you will need to land some planes before you can ask them to take off.

Images/Screenshots
---------

Getting started
---------

To start you will need to download the program onto your terminal. Do this by entering the directory you wish to copy to and execute the following.

`git clone git@github.com:marbuthnott/airport_challenge.git`

Once download enter `irb` and you'll be ready to run your airport!

Running tests
---------

Tests can be run from the root directory with:

`rspec`

Thank you for reading and I hope you have fun with the airport simulation!
