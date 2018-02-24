### Step 1 - Organise nouns and verbs of user stories into Objects and Messages



             Objects  | Messages
-------------         |     -------------
Air traffic controller|
Plane                 | flying?
Airport               | instruct_landing, instruct_take_off, plane_count
Weather               |  stormy?

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

- Committ

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
- Committ
