# Airport Challenge

Airport Challenge is a programme to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

**Assumptions:**
As no default capacity was given, I've assumed a default capacity of 1 for each airport.

## My approach to solving this challenge

*Update here*
*If unfinished outline how you'd plan to finish it*

### Understand the challenge
- I read through all of the instructions, twice 
- I set up Trello cards to help me manage and track my progress and extracted the instructions into a Trello card
- I created process checklists in Trello
- I extracted the user stories into this README
- I parsed the user stories for nouns and verbs
- I extract verbs and nouns into functional representation table
- I used a voice memo and lego to help me understand the domain
- I created a domain model using Lucidchart 

### Test driving the development of the features 

**For each user story I:**
- Wrote a feature test in feature_spec.rb
- Unit tested:
- - Ran RSpec requiring 'feature_spec.rb'
- - Read the error message 
- - Wrote a failing unit test to match
- - Wrote the simplest code to pass the unit test
-  -Refactored the code if possible
- Repeated the unit testing until the code passed the feature test

**Throughout this process I:**
- reflected on my understanding of the code and the TDD process (link)
- noted any questions I had below (link?)
- reflected on my learning process (link)
- tracked my time using Toggl
- used a pomodoro timer to remind me take regular breaks (25:5 work:break)


**My checklist for TDD process:**


- [] 
- [] discuss and make domain model 
- [] discuss to imagine feature test

- [] for each feature:
- [] write and run a failing feature test

- [] x.times do 
- [] write failing unit test - red
- [] simplest code to pass unit test - green
- [] refactor code - (iterative cycle itself - retest each time)

- [] run a passing feature test

**Reflection on my process**

*Self reflection here*

**Code review feedback**

*Add code review feedback here*

## Test Coverage

*Update here*

## User Stories 
Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Nouns: plane, airport
Verbs: instruct, land

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Nouns: plane, airport 
Verbs: instruct, take-off, confirm

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

Nouns: 
Verbs: prevent, is_full?

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Nouns: default_capacity
Verbs: overridden,

As an air traffic controller 
To ensure safety 
I want to prevent take off when weather is stormy 

Nouns: weather
Verbs: prevent, take off, is_stormy

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

Nouns: weather
Verbs: prevent, landing, is_stormy 

```

## Functional representation

| Objects | Messages |
|--- |--- |
| Plane | land, take_off, in_airport? |
| Airport | full? override(capacity) |
| Weather| stormy? |

## Domain model

<div style="width: 640px; height: 480px; margin: 10px; position: relative;"><iframe allowfullscreen frameborder="0" style="width:640px; height:480px" src="https://lucid.app/documents/embeddedchart/2b20faeb-dc8b-45e1-8200-193a02c8037b" id="mCdl_GxJ78UP"></iframe></div>

## File structure

airport-challenge
  lib
    plane.rb
    airport.rb
    weather.rb 
  spec
    plane_spec.rb
    airport_spec.rb
    weather_spec.rb
    feature_spec.rb
    
Update this:
```sh
$ tree
.
├── README.md
└── spec
    ├── docking_station_spec.rb
    └── spec_helper.rb
```


## Reflections 

* After passing the first unit test, I'm not sure which unit test to write next. respond to with(1).argument or Airplane undefined constant. 
* I'm not sure I'm writing the feature tests correctly in the feature_spec.rb
* I went back and removed an instance variable as I did not absolutely need it. 
* I changed one of the unit tests as it was no longer accurate. The one for takeoff returns airplane. Should I perhaps have written it differently?
*  What I'm finding hardest is framing the feature test. Maybe I could
* I'm updating my tests as I go along, e.g. changing 'JFK' to jfk. Is this correct?
* I'm not sure I'm using the correct data type for the argument to land() - should it be a string or a variable?
* In order for plane to have access to capacity I considered making @capacity into a global variable but this seemed like a bad idea. Then I remembered about attr_reader.



## TDD process reflections


* Feel like I am speeding up with each feature test and trusting the process of baby steps and KISS. My time tracking confirms this.
* I haven't been looking at the domain model for features 2 and 3, I will look at it now. It is out of sync with the code. 
* I've realised that I can write the feature test line by line in the feature_spec.rb, the same way I would a manual feature test in irb. This means the feature test gets written iteratively. Is this correct process?
* I'm tweaking the feature tests to work out exactly what it is I need the code to do. 
* I'm using `git log` to check my previous commit messages in order to try and keep them consistent.
* In terms of commit messages, I could try noting down how I am structuring them at the moment. Maybe next project I can plan to do this.
* This is harder doing it by yourself as you don't have someone to talk to help you articulate your thinking. I guess that is what the duck is for. My duck hasn't arrived yet. This reflection was in the context of @capacity / $capacity / attr_reader issue (see above.)
* I've used command+z to undo a lot of code. 100% test coverage is more important to me than the code at this stage. Baby steps. 
* It feels so weird writing the wrong code! e.g:

```
if airport == 'jfk' 
      raise 'Landing prevented as airport is full'
    end
```

* I'm being guided by my errors, and smiling if I'm getting different error messages each time.
* I anticipate that adding features for user story four will break the previous feature.

## Learning and wellbeing reflections
* Realise I am not taking breaks. Can use pomodoro timer when working on weekend challenges like I do in afternoon pair programming.
* I could listen to music as am working alone on this project.
* Reminding myself this is my first weekend project and I'll look back at the code in future and be amazed at how much progress I've made. 


```
# For user story 3:
# First I tried
jfk.capacity = full

# then
jfk(capacity) = 3

# then 
jfk(3) # where 3 is the capacity 

#finally
jfk.capacity(2) # this finally got the desired ArgumentError :smile:

```

## Questions

- What should a unit test be to develop the (airport) argument on the #land method? 
- Which is the best matcher for the unit tests. Are the ones I've used the best?
- Do I need to update the domain model if the code diverges from it? 
- Can you do version control on a domain model.
- Is it correct to write the feature test iteratively in small steps (e.g. user story 3).
- How could I improve my commit messages? 