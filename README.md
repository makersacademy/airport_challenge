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

User Story 1
---------
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

```
My first approach was to initiate rspec with the command rspec --init.
I then created my test file airport_spec.rb to write the first test.
As we used method stubs for the Boris bike project, I decided before hand to use it for this project. I used double for the Boris bike project, but searched more about it and decided to use let() {}.
As the first user story required the airport class to instruct a plane to land, my first test would be to expect to have this method present.
After rspec failed on it, I created the lib directory and created the airport.rb file with the instruct_plane_land method.
To implement the method and a better test I created a failing test and made it pass

```
it 'instructs plane to land and confirms it landed' do
  expect(airport.instruct_plane_land(plane)).to eq "#{plane} has landed"
end
```
User Story 2
---------
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

For the second user story I did more or less the same as the first I created and failed a test and implemented the method to make the test pass

```
it 'instructs plane to take off and confirms plane has left airport' do
  airport.instruct_plane_land(plane)
  expect(airport.instruct_plane_take_off(plane)).to eq "#{plane} has left airport"
end
```
But this time I had to land a plane first, so there was a plane to take off.

User Story 3
---------
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
With this user story weather condition was essential for plane landing and  taking off the test written was:

```
it 'Will prevent takeoff when weather is stormy' do
  airport.instruct_plane_land(plane)
  allow(airport).to receive(:bad_weather?).and_return(true)
  expect{ airport.instruct_plane_take_off(plane) }.to raise_error "Weather is not good, #{plane} cannot take off"
end
```
First of all an airplane needed to be landed, then I had to force the bad weather? method to return true and then raise an error when plane was trying to take off.
This started to get more complicated, I decided to create a new class for Weather and instead of using a random number to determine if the weather was stormy or not, I created a method with an array with more sunny values than stormy and used the sample method to return a random value.
Then I created a different method called stormy? that would return true if the weather was stormy and false it is was sunny.
I had an issue with accessing this inside airport class, when I was trying to make my test force bad weather to be true, it wasn't being able to force it and I've spent some time trying to figure out why.
I decided to create a private method inside airport that would evaluate if the weather was bad, I created an instance of the weather class inside initialize and called the stormy? method. After that tests were able to force the return I wanted and test passed.
After I had this method I've added them to my other tests.

User Story 4
---------

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

```
After figuring out how to force the return of the bad_weather? method, this one was straight forward

```
it 'Will prevent landing when weather is stormy' do
  allow(airport).to receive(:bad_weather?).and_return(true)
  expect{ airport.instruct_plane_land(plane) }.to raise_error "Weather is not good, #{plane} cannot land"
end
```
User Story 5
---------

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
For this user story I used what I learned with Boris bike, and set a default capacity for my airport hangar. Now I just had to create a method that would return true for fulness if I tried to land an airplane beyond the hangar capacity. I set the default capacity for 15 planes.

```
it 'plane cannot land if hangar is already full' do
  15.times { airport.instruct_plane_land(plane) }
  expect{ airport.instruct_plane_land(plane) }.to raise_error "Hangar is full, #{plane} not able to land"
end
```

User Story 6
---------
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
With my default capacity already created I need to made it available for being overridden. I decided to pass the capacity as a parameter to the airport initialize, so if I wanted to change the capacity I just had to pass a new value as an argument to the new instance of the airport class.

Edge cases
---------
Overall I've written 24 unit tests, but some edge cases were:

```
it 'counts how many planes are in hangar' do
  10.times { airport.instruct_plane_land(plane) }
  expect(airport.planes_count).to eq 10
end

it 'counts how many planes are in hangar after two plane takes off' do
  10.times { airport.instruct_plane_land(plane) }
  2.times { airport.instruct_plane_take_off(plane) }
  expect(airport.planes_count).to eq 8
end

it 'Depending on the weather it will allow or deny landing' do
  if :bad_weather? == true
    expect{ airport.instruct_plane_land(plane) }.to raise_error "Weather is not good, #{plane} cannot land"
  else
    expect(airport.instruct_plane_land(plane)).to eq "#{plane} has landed"
  end
end
```

What went well?
---------
Spending the week working with the Boris bike project helped a lot with this challenge.
Although I am still not 100% fluent with rspec and using multiple classes interacting with each other, I could learn enough to make my job easier.
I also learned new ways of using mocking behavior and method stubs that I thought was neater and better then what I used for the Boris bike project. I could also unblock myself when I got stuck with stormy? method.
I felt very proud of myself.

What could have gone better?
---------

I am still struggling a bit with over thinking problems and not being methodical enough.

What will I change for next week?
---------

Being more methodical, research and learn more about classes/modules.
