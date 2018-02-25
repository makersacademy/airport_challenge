### Step 1 - Organise nouns and verbs of user stories into Objects and Messages
             Objects  | Messages
-------------         |     -------------
Air traffic controller|
Plane                 |
Airport               | instruct_landing, instruct_take_off, plane_count
Weather               | stormy?

### Step 2 - Feature test in ```pry```
```NameError: uninitialized constant Airport
from (pry):1:in \__pry__'
```

**Need to define an** ```Airport``` **class**.

### Step 3 - From feature test to unit test (using RSpec)
- Following a TDD approach, before creating an ```Airport``` class, I wrote a failing unit test
in file ```airport_spec.rb```:
```Describe Airport do
end
```

- After running RSpec, I got the following error:
```An error occurred while loading ./spec/airport_spec.rb.
Failure/Error:
  describe Airport do

  end

NameError:
  uninitialized constant Airport
# ./spec/airport_spec.rb:1:in `<top (required)>'
```

-The test does not know what ```Airport``` is, therefore we need to create an ```Airport``` class.

### Step 4 - Define an ```Airport``` class
_Classes and modules are going to be defined in folder_ ```lib```

- Created an ```Airport``` class in ```lib``` folder. In order for the RSpec to pass, we need to add a ```require```
function to link ```spec/airport_spec.rb``` and ```lib/airport.rb```

- Test passes!

- Commit

### Step 4 - Run feature test to assess expected ```Airport``` class behaviour
- ```[4] pry(main)> plane = airport.instruct_landing
NoMethodError: undefined method `instruct_landing' for #<Airport:0x00007f820a174d58>
from (pry):4:in `__pry__'
```
Error tells us that there is no method called ```instruct_landing```.

### Step 5 - Test drive code by unit tests
- In ```spec/airport_spec.rb```, I created a unit test for ```instruct_landing```
```it { is expected_to respond_to :instruct_landing}
```
- After running RSpec, I got the following error:
```
Airport
should respond to #instruct_landing (FAILED - 1)

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Failures:

  1) Airport should respond to #instruct_landing
     Failure/Error: it { is_expected.to respond_to :instruct_landing }
       expected #<Airport:0x00007ff40fa88b70> to respond to :instruct_landing
     # ./spec/airport_spec.rb:4:in `block (2 levels) in <top (required)>'

Finished in 0.07628 seconds (files took 0.28992 seconds to load)
1 example, 1 failure
```
- In order for the test to pass, I updated ```Airport``` class defining the ```instruct_landing``` method:
```
class Airport
  def instruct_take_off

  end
end
```
- Test passes!
- Commit

### Step 8 - Build a plane
- In ```spec``` folder, I created a ```plane_spec.rb``` file to test for a ```Plane``` class.
- Ran RSpec and got the following errors:
```
NameError:
  uninitialized constant Plane
# ./spec/plane_spec.rb:1:in `<top (required)>'
```
- Therefore, I created a ```lib/plane.rb``` and defined an empty ```Plane```:
```
class Plane

end
```
- Unit test passes!

### Step 9 - Create class for weather and corresponding unit test
- Same approach as **Step 8**

- Commit

### Step 10 - Make the airport instruct a plane to land
- Wrote a unit test in RSpec for the method ```instruct_landing```
- Similarly to step 14 in ```boris-bikes``` challenge, in ```Airport``` class, I set up an initial attribute ```@planes = []``` using ```initialize```.
- Used ```attr_reader``` to read ```@planes = []```
- I updated ```instruct_landing``` method and passed an argument ```plane``` to it. Through the ```<<``` operator, ```plane``` is going to be added to the ```@planes``` array.
- **Airport now instructs plane to land**
- Commit

### Step 10.5 - Change test for ```instruct_landing```
- Replace ```receive``` with ```respond_to(:instruct_landing).with(1).argument``` following example from ```boris-bikes```
- Commit

### Step 11 - Make the airport instruct a plane to take off
- Ran feature test in ```pry``` and got the following error:
```NoMethodError: undefined method `instruct_take_off' for #<Airport:0x00007fd5912dd548 @planes=[]>
```
- Wrote a unit test in RSpec for ```instruct_take_off```. Test gives the following error:
``` Failure/Error: expect(airport).to respond_to(:instruct_take_off)
       expected #<Airport:0x00007fa0290b2ea0 @planes=[]> to respond to :instruct_take_off
```
- Defined ```instruct_take_off``` in ```Airport``` class, which makes the RSpec test pass. However, the feature test in ```pry``` still fails, giving the following error:
```ArgumentError: wrong number of arguments (given 1, expected 0)
from /Users/WorkStuff/Desktop/gitDir/airport_challenge/lib/airport.rb:12:in `instruct_take_off'
```
- To fix this error, I changed the unit test to take one argument and also passed one argument to ```instruct_take_off``` method.
- Tests are passing now.
- **Airport now instructs plane to take off**
- Commit

### Step 12 - Prevent landing when airport is full
- Ran feature test in ```pry```, at this stage an infinite number of planes can land to the airport.
- Wrote unit test that raises an error once 20 or more planes are landed.
- In ```Airport``` class, I set up another attribute ```@capacity``` that, for the moment, uses a _magic number_.
- Feature and unit tests pass
- **Landing is now prevented when airport is full**
- Commit

### Step 13 - A bit of refactoring
- Got rid of the _magic number_ by passing ```capacity``` to ```initialize``` in ```Airport``` class
- Commit

### Step 14 - More refactoring (inspired by [Sam's tutorial](https://www.youtube.com/watch?v=Vg0cFVLH_EM))
- To make the code more readable, I defined a new ```private``` method ```full?```. The method is private because it won't be called from outside the class.
- Further refactoring in ```airport_spec.rb```

### Step 14 - Prevent landing and take off when weather is stormy
- Wrote unit test to prevent landing and take off when weather is stormy.
- Used new RSPec syntax: ```context``` to group tests that are related logically
- Defined a new ```private``` method called ```stormy?``` that generates random output.
  **At some point, the** ```stormy?``` **method** **will have to be placed in** ```Weather``` **Single Responsibility Principle**
- Test passes
- **Landing and take off are now prevented when weather is stormy**
- Commit

### Step 15 - Take stormy? method to another class (Single Responsibility Principle)
- Wrote unit test in ```weather_spec.rb``` for both "stormy" and "not stormy" conditions, following both [code review rubric](docs/review.md) and [Sam's tutorial](https://www.youtube.com/watch?v=Vg0cFVLH_EM)].
- Ran RSpec and got following error:
```NoMethodError:
       undefined method `stormy?' for #<Weather:0x00007f822a98d128>
```
- In class ```Weather```, I defined method ```stormy?``` and private array of default values ```OUTLOOKS``` along with private method ```random_outlook```, which randomly selects one of the four items in the array (see [code review rubric](docs/review.md)).
- As per instructions, I used a stub to override random weather (see [code review rubric](docs/review.md)).
- ```Airport``` class does not depend on ```Weather``` class anymore.
- Commit

### Step 16 - Plane can only take off from airport it is in (edge case)
- Feature test in ```pry``` shows that same plane can take off from any airport
- ```
[37] pry(main)> airport
=> #<Airport:0x00007ff112a50090 @capacity=21, @planes=[#<Plane:0x00007ff112b190d0>], @weather=#<Weather:0x00007ff112a500b8>>
[38] pry(main)> airport_2
=> #<Airport:0x00007ff112af1d78
 @capacity=20,
 @planes=[#<Plane:0x00007ff112b190d0>, #<Plane:0x00007ff112b190d0>],
 @weather=#<Weather:0x00007ff112af1da0>>
[39] pry(main)> airport_2.instruct_take_off(plane)
RuntimeError: Cannot take off due to stormy weather
from /Users/WorkStuff/Desktop/gitDir/airport_challenge/lib/airport.rb:20:in `instruct_take_off'
[40] pry(main)> airport.instruct_take_off(plane)
RuntimeError: Cannot take off due to stormy weather
from /Users/WorkStuff/Desktop/gitDir/airport_challenge/lib/airport.rb:20:in `instruct_take_off'
[41] pry(main)> airport.instruct_take_off(plane)
=> nil
```
- Wrote test in ```#instruct_take_off``` in ```airport_spec.rb``` to raise error if plane is not at specific airport, ran rspec and got the following error:
```Failure/Error: expect { airport.instruct_take_off(plane) }.to raise_error 'Plane cannot take off. Plane at another airport'
       expected Exception with "Plane cannot take off. Plane at another airport" but nothing was raised
```
- Updated the ```instruct_take_off``` method and refactored it based on Sam's tutorial
- **A plane can now only take off from the airport it is in**
- Commit

- **Step 17 - Default capacity of airport to be overriden as appropriate**
- Ran feature test in ```pry```; wanted to create a new airport with default capacity, however because our current code initializes ```Airport``` class objects with two variables (```@capacity``` and ```@weather```), I got the following error:
```[3] pry(main)> default_airport = Airport.new(Weather.new)
ArgumentError: wrong number of arguments (given 1, expected 2)
from /Users/WorkStuff/Desktop/gitDir/airport_challenge/lib/airport.rb:6:in `initialize'
```
- First thing that could have been done to solve the error would have been to swap initialized variables ```capacity``` and ```weather``` in unit test.
- RSpec failed, I swapped initialized variables also in ```Airport``` class.
- Rspec test passes.
- In feature test in ```pry```, I still got the error above.
- I needed to get rid of the _magic number_, I could have encapuslated the numerical literal in a constant in my production code, however, I wanted to write a unit test first.
- Following Sam's tutorial, in ```airport_spec.rb```, I created a new context for ```defaults``` and wrote a test for a default instance of ```Airport``` class (```default_airport```).
- Ran RSPec and got the following error:
```Airport#instruct_landing when weather not stormy when full does not allow plane to land
     Failure/Error: Airport::DEFAULT_CAPACITY.times { airport.instruct_landing(plane) }

     NameError:
       uninitialized constant Airport::DEFAULT_CAPACITY
```
- I initialized the constant ```DEFAULT_CAPACITY``` in ```Airport``` class. Ran RSpec and test passes
- **Set default airport capacity**
- Commit

- **Step 18 - Flying plane cannot take off and cannot be in airport (edge cases)**
- Ran feature test in ```pry``` and got the following error:
```[11] pry(main)> airport.instruct_landing(plane)
=> [#<Plane:0x00007f897193f880>]
[12] pry(main)> flying_plane = airport.instruct_take_off(plane)
=> nil
[13] pry(main)> flying_plane.instruct_take_off
NoMethodError: undefined method `instruct_take_off' for nil:NilClass
from (pry):13:in `__pry__'
```
- Need to define method for ```Plane``` class.
- Wrote unit test in ```plane_spec.rb```, and test in RSpec fails.
- On to the production code, I defined ```instruct_take_off``` method in ```Plane``` class. Test passed.
- Wrote another unit test that raises an error when trying to take off a plan that is already flying. Ran RSpec and got the following error message:
``` Failure/Error: expect { plane.instruct_take_off }.to raise_error 'Plane cannot take off, plane is flying already'
       expected Exception with "Plane cannot take off, plane is flying already" but nothing was raised
```
- In the production code, in ```Plane#instruct_take_off```, raised an error and test passed.
- As per Sam's tutorial, in order for ```#instruct_take_off``` not to return ```nil```, in ```airport_spec.rb```, I wrote a test that is supposed to return the plane that took off. Ran RSpec and got following error:
``` Failure/Error: expect(airport.instruct_take_off(plane)).to eq plane

       expected: #<Double :plane>
            got: nil

       (compared using ==)
```
- Need to update production code. In ```Airport#instruct_take_off```, return ```plane```. RSpec test passed
- **Flying plane cannot take off**
- Commit
- To test for flying plane that cannot be in airport, I ran feature test calling a method ```airport``` on ```flying_plane``` and got the following error:
```
NoMethodError: undefined method `airport' for #<Plane:0x00007fc909b23ac0>
from (pry):8:in `__pry__'
```
- In ```plane_spec```, I described ```#airport```. Ran test in RSpec and got following error:
```Failure/Error: it { is_expected to respond_to :airport  }

     NoMethodError:
       undefined method `to' for #<RSpec::ExampleGroups::Plane::Airport:0x00007ff347147548>
```
- In the production code, I defined ```Plane#airport``` and test passed.
- In feature test, calling ```Plane#airport``` returns ```nil```. Need to do something.
- Wrote a unit test to raise error when plane is flying and cannot be at airport. RSpec test failed.
- Need to update production code by raising error in ```Plane#airport```. Test passed.
- **Flying plane cannot be in airport now**
- Commit

- **Step 19 - Plane that are landed cannot land again and must be in airport (edge cases)**
- Ran feature test to land plane and got following error:
```[7] pry(main)> plane.instruct_landing
NoMethodError: undefined method `instruct_landing' for #<Plane:0x00007fd0281e7440>
from (pry):7:in `__pry__'
```
- Wrote a unit test to describe ```#instruct_landing```. Ran test in RSpec and got following error:
```Plane#instruct_landing should respond to #instruct_landing
     Failure/Error: it { is_expected.to respond_to :instruct_landing}
       expected #<Plane:0x00007fd856b97748> to respond to :instruct_landing
```
- Defined ```Plane#instruct_landing```. RSpec test passed.
- Wrote a unit test to raise error for plane that has already landed. RSpec test failed.
- Updated production code by raising error in ```Plane#instruct_landing```. RSpec test passed.
- In feature test, when trying to ```instruct_landing``` on ```Plane``` instances, I kept getting following error:
```[13] pry(main)> plane.instruct_landing
RuntimeError: Plane cannot land. Plane has already landed
from /Users/WorkStuff/Desktop/gitDir/airport_challenge/lib/plane.rb:8:in `instruct_landing'
[14] pry(main)> plane2 = Plane.new
=> #<Plane:0x00007fc97704d6a0>
[15] pry(main)> plane2.instruct_landing
```
- I got very stuck (more than usual) and decided to follow - and try to understand [Sam's solution](https://www.youtube.com/watch?v=Vg0cFVLH_EM).
- In ```Plane``` initialized variable ```@flying = true``` (plane definitely flying).
- In ```Plane#instruct_landing``` updated code so that plane cannot land ```unless @flying``` (instruct_landing is false)
- RSpec test passes but feature test fails.
- Update unit test in ```airport_spec.rb```. in ```#land``` description, we except plane to receive ```:instruct_landing```.
- Ran RSpec and got following error:
```Failure/Error: expect(plane).to receive(:instruct_landing)

       (Double :plane).instruct_landing(*(any args))
           expected: 1 time with any arguments
           received: 0 times with any arguments
```
- In ```Airport#instruct_landing```, set up ```plane.instruct_landing``` (equal to false). RSpec failed:
```Failure/Error: plane.instruct_landing
       #<Double :plane> received unexpected message :instruct_landing with (no args)
```
- Want to make sure ```:double``` receives ```#instruct_landing``` (updated ```airport_spec.rb```).
- RSpec test passed. However, in feature test, I still got ```RuntimeError: Plane cannot land. Plane has already landed```.
- Updated ```airport_spec.rb```, ```plane_spec.rb``` and ```Airport``` and ```Plane``` class following [Sam's solution](https://www.youtube.com/watch?v=Vg0cFVLH_EM) as I did struggle with this bit. RSpec and feature tests are both successful.
- **Planes that have already landed cannot land again now and are stored in airport**
- Commit 
