## Airport Challenge
This is the first weekend challenge after one full week onsite at Makers Academy. The project is effectivly to design and build a functional airport in Ruby, using a TDD process to lead the development with RSpec being used for the tests.  

## Motivation
I am working on this project to build on my coding skills from a foundational level up to a professional standard. I wish to follow best practice, and will be starting with the user story, followed by planning the process on paper, deciding on the potential objects, methods and control flow. 

## Build status
Currently under construction (9th March 2019). With exception of a few edits i stopped working on it on 10th March 2019, and left the projects with an incomplete status. 

## Code style
- Rubocop for linting
 
## Screenshots
- None taken at this stage. 

## Tech/framework used
<b>Built with</b>
- Ruby
- Rspec
- TDD
- OOP
- SimpleCov for test coverage

## Features
This project will have multiple interrelated Classes, Methods and Objects required from seperate files. The aim of the project is to build the airport programme following as strict a TDD process as I am able to at my current level of skill. 

The initial consiseration of the objects and methods, after reviewing the user story includeded the below, however they ended ended up somewhat different to that shown here:

| Objects             | Methods                  |
|---------------------|------------------------- |
| Plane               | Land                     |
|                     | Takeoff                  |
| In Flight           | Allow landing            |
|                     | Prevent flight           |
| Landed Status       | Allow takeoff            |
|                     | Prevent landing          |
| Airport Capacity    | Prevent landing          |
|                     | Allow landing            |
| Airport Controller  | Instruct Landing         |
|                     | Instruct takeoff         |
|                     | Confirm plane not landed |
|                     | Confirm plane landed     |
| Weather Sunny       | Allow landing            |
| Weather Stormy      | Prevent landing          |
|                     | Prevent takeoff          |



## Installation
Ruby v 2.5.0 was used to build the programme, rubocop was used to lint the programme, the spec_helper.rb file with details is included here. I used VSCode for writing the code. 

## Tests
A Spec file has been created and Rspec has been init'd and used for TDD purposes. 

## How to use?
If completed this will be a simple Ruby Programme which can be run from the terminal. 

## Contribute
No contributions to this project are required or requested, it is simply a training exercise. 

## Credits
The original project / problem set was built created by Makers Academy, this code was written by Jeremy Smith. 
