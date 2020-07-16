# Code review rubric

**Don't read this until after you've completed the challenge!**

You're a beginner — your code will have some rough spots. This is a field guide to spotting common issues that crop up in the Airport challenge, and some guidance on how to fix them.

You'll be using this to review someone else's code. Help them improve by looking through their code for issues like this, or anything else that you might spot. Don't worry too much about being mistaken — if it looks like it could be a problem to you, try telling them about it! Even if they disagree, the discussion you'll have about it can be a great learning opportunity.

Also, there's a tonne of stuff here. Pace yourself, take on the improvements that feel most powerful to you and keep the rest in mind for future.


## Does it pass the tests?

Please checkout your reviewee's code and run their tests. Read the code and try some manual feature tests in IRB. How easy is it to understand the structure of their code? How readable is their code? Did you need to make any cognitive leaps to 'get it'?

## Is the README useful?

### README is updated

Please do update your README following the [contribution notes](https://github.com/makersacademy/airport_challenge/blob/master/CONTRIBUTING.md), i.e.
* Make sure you have written your own README that briefly explains your approach to solving the challenge.
* If your code isn't finished it's not ideal but acceptable as long as you explain in your README where you got to and how you would plan to finish the challenge.

The above is a relatively straightforward thing to do that doesn't involve much programming - I'll often get it done while thinking about other problems in the back of my mind :-)

* http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme

### Instructions in README
It's a great idea to show the full story of how your app is used (from a user's perspective) in the README, i.e. a code example or irb transcript

```
$ irb
2.2.3 :001 > airport = Airport.new
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007fafdb0041b8>
2.2.3 :003 > airport.land(plane)
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[#<Plane:0x007fafdb0041b8>], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :004 >
```

## Are the tests well-written?

### Use `context` and `describe` blocks to create test scopes

If a group of tests share the same setup or are related logically, group them in a `context` block or a `describe` block.  Use `describe` when the tests are related by a subset of behaviour (e.g 'landing') and use `context` when the tests are related by program state (e.g. 'when it is stormy').

`let`, `subject` and `before` statements inside a context or describe block will only run for tests inside the block and will override similar statements in an outer block.

### Avoid Vacuous Tests

Sometimes you are not really testing anything in your application code e.g.

```ruby
# plane_spec.rb
subject(:plane) { described_class.new }
let(:airport) { double: airport }

it 'is in the airport after landing' do
  allow(airport).to receive(:land)
  allow(airport).to receive(:planes).and_return [plane]
  airport.land(plane)
  expect(airport.planes).to include plane
end
```

All this does is test the stubbing behaviour of the `airport` double - it's not testing any of the actual application code.  This is often caused by a test being in the wrong place.  Since the expectation is on the state of `airport`, this is a strong indication that this test should be in `airport_spec.rb`:

```ruby
# airport_spec.rb
subject(:airport) { described_class.new }
let(:plane) { double :plane }

it 'has the plane after landing' do
  allow(:plane).to receive(:land)
  airport.land(plane)
  expect(airport.planes).to include plane
end
```

### Use `before` blocks to set up objects rather than repeat code

For example, to set up stubbing behaviour that is shared across a number of tests:

```ruby
describe 'a group of tests that need to call #land on a plane double' do
  before do
    allow(plane).to receive(:land)
  end

  it ...
end
```

### Ensure Sufficient Unit Tests

The following test on its own is not sufficient for testing the landing of planes:

```ruby
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it 'can land planes' do
    allow(plane).to receive(:land)
    subject.land plane
    expect(subject.planes).to include plane
  end
end
```

We are not testing that the `land` method of `plane` is called.  This should be included in a further test:

```ruby
describe 'landing planes' do
  it 'instructs the plane to land' do
    expect(plane).to receive(:land)
    subject.land plane
  end

  it 'has the plane after it has landed' do
    allow(plane).to receive(:land)
    subject.land plane
    expect(subject.planes).to include plane
  end
end
```

Does every implementation in the code have associated unit tests?  For example, if you take off a specific plane:

```ruby
def take_off(plane)
  ...
end
```

And the airport has multiple planes, does it test that the _correct_ plane is removed from the airport?

### Avoid multiple `expect`s in `it` block

The previous example _could_ be combined into one test, but this is not good practice for unit tests:

```ruby
it 'instructs the plane to land and then has the plane' do
  expect(plane).to receive(:land)
  subject.land plane
  expect(subject.planes).to include plane
end
```

Also, avoid additional `expect`s when stubbing.  Prefer `allow`.  Avoid the following double expect:

```ruby
it 'does not allow plane to take off' do
  expect(weather).to receive(:stormy?).and_return(true)
  expect{airport.take_off}.to raise_error 'Cannot take off due to stormy weather'
end
```

We are not _testing_ that `weather` receives `stormy?` in this test, so it should be:

```ruby
it 'does not allow plane to take off' do
  allow(weather).to receive(:stormy?).and_return(true)
  expect{subject.take_off}.to raise_error 'Cannot take off due to stormy weather'
end
```

### Stub Randomness in Tests

It's important that tests don't fail randomly, so it's critical that any randomness in your application is stubbed out to ensure tests pass reliably, e.g.

```ruby
describe 'storm blocks landing' do
  allow(weather).to receive(:stormy?).and_return true
  message = 'Unable to land due to stormy weather'
  expect { airport.land(plane) }.to raise_error message
end

describe 'a plane can land after storm has cleared' do
  allow(weather).to receive(:stormy?).and_return false
  expect { airport.land(plane) }.not_to raise_error
end
```

### Eliminate Redundant `respond_to` expectations

Note that tests like this:

```ruby
it 'can land a plane' do
  is_expected.to respond_to(:land).with(1).argument
end
```
can be collapsed to one liners like this

```ruby
it { is_expected.to respond_to(:land).with(1).argument }
```

and also that these become somewhat redundant once you are actively testing the method like so:

```ruby
it 'fails when the airport is full' do
  airport.land(plane)
  error = 'Cannot land since airport is full'
  expect { airport.land(double :plane) }.to raise_error error
end
```

The `respond_to` tests are an initial step you go through using the tests to drive the creation of an objects public interface, and can safely be deleted once you have more sophisticated tests that check both the interface methods and their responses (and associated changes in state)  

### Breaking over multiple lines redundancy

Note that by breaking some long lines (to go below 80 chars) in:

```ruby
  it 'a plane can only take off from an airport it is at' do
    expect { airport.take_off(plane) }.to raise_error
    'The plane is not currently landed at this airport'
  end
```

creates two separate lines that are interpreted separately.  The expect now checks for any error (regardless of message) and the single string 'The plane is not currently landed at this airport' on the following line is effectively discarded.  Prefer something like the following:

```ruby
  it 'a plane can only take off from an airport it is at' do
    message = 'The plane is not currently landed at this airport'
    expect { airport.take_off(plane) }.to raise_error message
  end
```


## Is the application code well-written?

### Naming Convention Matching the Domain Model

In general it's critical for maintainability that code is readable.  We want to ensure that other developers (and ourself in the future) can come to the codebase and make sense of what's going on.  That's supported by having the naming conventions match that of the ruby community and of the domain model (in this case 'air traffic control').

So for example we might have the following:

```ruby
class air_port

  def ExtractEntityFromSky(747-400)
    ...
  end
end
```

This breaks several [ruby coding conventions](https://github.com/bbatsov/ruby-style-guide).  If we don't follow these we will confuse other Ruby programmers. Critical fails in the above are that in Ruby class names should be in CamelCase and method names should be in snake_case, and that variables (such as method parameters) can't start with a sequence of numbers. We also have domain model issues here, in that `747-400` is too specific, and `ExtractEntityFromSky` is a convoluted way to say `land`. So we would prefer the following:

```ruby
class Plane

  def land(airport)
    ...
  end
end
```

This allows us to write readable code like so:

```
$ airport = Airport.new
$ airport.land(plane)
```

* [Ruby Style Guide: CamelCase for classes and modules](https://github.com/bbatsov/ruby-style-guide#camelcase-classes)
* [Ruby Style Guide: snake_case for symbols, methods and variables](https://github.com/bbatsov/ruby-style-guide#snake-case-symbols-methods-vars)

### Remove all Commented-out code

When submitting delete all "commented out" code.  You may not yet trust git to store all your old code, and you might not feel confident about rolling back to old commits to see that code, but that shouldn't be an excuse for leaving big chunks of commented out code in your files.  Make sure you commit to git (and push to GitHub) regularly, and start to get familiar with how to check out previous versions of your code.  If you are still worried store old versions of code in other files that you don't check in.  What we're trying to get you into the habit of, is polishing your submission so that it would be acceptable as a submission to a company as a technical test. So we don't want to see any of this:

```ruby
def initialize(capacity: 1, weather: Weather.new)
  # @weather = Weather.new
  @capacity = capacity
  @planes = []
  @weather = weather
end
```

Just delete commented out lines in your final submission.  Descriptive comments are just about okay, but please prefer to try and make the code describe itself, e.g.

```ruby
def land(plane) # this lands the plane at the airport
  fail 'Cannot land since airport is full' if full?
  fail 'Unable to land due to stormy weather' if weather.stormy?
  planes << plane # this adds the plane to the planes at the airport
  self
end
```

Are the above comments really necessary? Comments like this aren't tested, and so can easily go out of date.  Prefer to name your methods so they describe exactly what they do.

### Use guard clause to improve readability and unrelated conditionals:

Replace:

```ruby
if stormy?
  fail 'Bad weather'
elsif full?
  fail 'Airport full'
else
  planes << plane
end
```

With:

```ruby
fail 'Bad weather' if stormy?
fail 'Airport full' if full?
planes << plane
```

* [Style Guide: No Nested Conditionals](https://github.com/bbatsov/ruby-style-guide#no-nested-conditionals)
* [Style Guide: If as a modifier](https://github.com/bbatsov/ruby-style-guide#if-as-a-modifier)

### Use Implicit Return of Booleans

Avoid ternaries and if/else to return booleans that can be returned implicitly:

```ruby
def stormy?
  weather == :stormy ? true : false
end
```

or:

```ruby
def stormy?
  if weather == :stormy
    true
  else
    false
  end
end
```

`weather == :stormy` is already a boolean expression, so the ternary or if/else statement is redundant:

```ruby
def stormy?
  weather == :stormy
end
```

### Do not Expose Internal Implementation

Be careful not to give 'public' access to objects and methods that are should only be accessed internally.  E.g.:

```ruby
class Airport
  # ...

  def planes
    @planes
  end
end
```

The `planes` method exposes the internal array of planes and so should not be publicly accessible.  Use the `private` keyword to prevent this:

```ruby
class Airport
  # ...

private

  def planes
    @planes
  end
end
```

### Single Responsibility Principle (SRP)

#### Classes

A class should have one responsibility.  An airport is responsible for the coming and going of airplanes.  It needs access to weather information to make decisions, but it _should not be responsible for determining the weather_.  Weather information should be provided by a separate class and injected into airport as a dependency.  E.g.:

```ruby
class Weather
  def stormy?
    ...
  end
end

class Airport
  def initialize(weather: Weather.new)
    ...
  end

  def take_off(plane)
    fail 'Unable to take off due to stormy weather' if weather.stormy?
    ...
  end

  private
  attr_reader :weather
end
```


#### Methods

A method also should have only one responsibility.  E.g _the following method is too long_:

```ruby
def stormy?
  outlooks = [:stormy, :fine, :fine, :fine]
  index = Random.rand(4)
  outlooks[index] == :stormy
end
```

Although there are clearly several other issues with this method, the example is intended to show a method with too many responsibilities:

* It defines the outlooks,
* it handles the random number selection,
* it extracts an outlook from the outlooks array and
* it translates the random selection to a boolean to indicate `stormy?`

It can be refactored to have only one responsibility.  Although this introduces more code, the goal is _readability_ and reducing cognitive overload when scanning the code:

```ruby
def stormy?
  random_outlook == :stormy
end

private

OUTLOOKS = [:stormy, :fine, :fine, :fine]

def random_outlook
  OUTLOOKS.sample
end
```
Note: Ruby already handles the responsibility of choosing randomly from and array with the `sample` method.

### Avoid Magic Numbers (e.g. on capacity)

```ruby
def initialize
  @capacity = 6
end
```

`6` is a numeric literal and its purpose in this statement is unclear.  Encapsulate in a constant:

```ruby
DEFAULT_CAPACITY = 6

def initialize
  @capacity = DEFAULT_CAPACITY
end
```

### Prefer Symbols over Strings

Each time a string literal (e.g. `'flying'`) is interpreted by Ruby, a new string object is created in memory.  Therefore, every time a method is called that contains a string literal (e.g. `'sunny'`) a new object is created.  This can lead to lots of unnecessary objects being created when we're not interested in the _object identity_ of a string, just its _value_.  To overcome this, use symbols instead e.g.: `:flying`, `:sunny`.

### Separately name Command and Query methods

Methods should be _either_ **commands** or **queries**, not both.  As a general rule:

- Command method names should start with a verb: _what does the method do?_
- Query method names should be nounal.
- Avoid naming query methods starting with a verb.
- Avoid nounal command method names.
- Avoid depending on the return value of a command method (this rule is often broken!).
- Never have query methods that alter program state.

### Avoid defining `attr_reader` then accessing the instance variable directly.

```ruby
attr_reader :capacity

def full?
  planes.count >= @capacity
end
```

Prefer delegating to the reader method (`planes.count >= capacity`) if it is defined, instead of accessing the instance variable.

### Prefer `attr_reader` over `attr_accessor`

`attr_accessor` allows a caller to change the attribute to any object they like.  In general, `attr_accessor` is a code smell.


### Avoid using `attr_accessor` and then defining another mutator (do one or the other)

```ruby
class Plane
  attr_accessor :landed

  def land
    landed = true
  end
end
```

Which is the correct use of an instance of `Plane`?

```ruby
plane.landed = true
```

or

```ruby
plane.land
```
*Prefer the custom method (`land`) for more control over the value of `@landed` and use `attr_reader` instead.*

### Avoid Redundant lines of code

It's easy to have redundant lines of code hanging around.  Anything you think might be redundant can be checked by deleting it and re-running your tests.  If still green you didn't need that code.  If you think you really did then you need a test to match it - and you should have written that first before writing the code.

Some examples of redundancy:

### Instance variable redundancy

Instance variables are initialized when first assigned so the two lines of code inside the following initialize method are completely redundant:

```ruby
def initialize
  @name # does nothing
  @title = nil # totally redundant
end
```
