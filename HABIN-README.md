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
Week one weekend challenge @ Makers Academy. Learning about TDD and OO programming. Includes concepts of classes (instantiating), modules (mixins) and doubles (mocking), using rspec and Ruby.

```
Instructions for use:

- Run command line
- 'gem install bundle'
- 'run bundle'

Test in irb shell

- 'irb'
- 'require './dir/airport.rb'' (change according to class you want to test methods for)
- i.e. 'plane.land?'

Examples of creating instances in irb as follows:

- plane = Plane.new
- plane.takeoff > true
- plane.land? > false

```

Aims:

This weekend's challenge is using the skills that we learnt during the week's challenge, using similar concepts of TDD and OOP when building a real world program. I wanted to make sure to use the techniques that I learnt this week, and taking it step by step instead of jumping staight into coding. This meant that I followed the process of RED - GREEN - REFACTOR. I wanted to get used to the cycle of building tests in rspec first and then building the methods in the production file, getting used to the process of writing TDD code.

Approach:

I started off by breaking down the client instructions into a table, putting nouns into an Object column, and verbs in a Message column. From this step I made a checklist of actions wanted by the client:

  1. Land a plane
  2. Plane takes off, no longer at airport
  3. Prevent plane take off, when stormy weather
  4. Prevent plane landing, when stormy weather
  5. Prevent plane landing, when airport is full
  6. Airport capacity can be overridden as appropriate

I inferred that I would need two initial classes, one for Plane and one for Airport. I began working through each of the main client points, writing a feature test first, then the unit test in the spec file, then the methods in the class file. I made sure to test regularly and run Rubocop. I have also made frequent commits throughout with very clear commit messages. I have tried to use techniques that I learnt this week including Modules and Doubles. 

```
Original client instructions:

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

```
