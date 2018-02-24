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

-Following a TDD approach, before creating an ```Airport``` class, I wrote a failing unit test
in file ```airport_spec.rb```:
```Describe Airport do
end
```

-After running RSpec, I got the following error:
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

-Created an ```Airport``` class in ```lib``` folder. In order for the RSpec to pass, we need to add a ```require```
function to link ```spec/airport_spec.rb``` and ```lib/airport.rb```

-Test passes!
