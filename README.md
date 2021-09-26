Airport Challenge - Jacob Cho
=================

Introduction
---------

* My work on the Airport Challenge for Makers Academy week 1

Approach
-------

1. First I developed an outline of the client's requests, and put this on my rspec test.  I found this massively helpful in organizing my thoughts and the tasks at hand.

```
require 'airport'

describe Airport do
    context 'when weather is clear' do
        it 'should land a plane'
        it 'should tell plane to take off'
        it 'should confirm a recently airborne plane is no longer at airport'
    end

    context 'when weather is stormy' do
        it 'should not land a plane'
        it 'should not tell a plane to take off'
    end

    context 'when Airport is full' do
        it 'should not land a plane'
    end


    context 'when system designing' do
        it 'should have a default capacity'
        it 'should change the default capacity' 
    end

end
```
2. I had relative ease with landing and flying out airplanes.
3. My biggest blocker was in the integration of weather.  My weather class was in a separate file.  It was creating random weather.  But I struggled to use a double in my unit test:


```
...
weather = Weather.new
 allow(weather).to receive(:bad?).and_return true 
...
```

This was supposed to force-test bad weather, but the results were still random.  Eventually I realized that I was summoning a Weather object that was different from the one Airport had already summoned.  I checked their object ids and sure enough they were different.  So I modified my test to bring out Airport.weather, and the tests finally worked:

```
...
weather = Weather.new
 allow(subject.weather).to receive(:bad?).and_return true 
...
```



**Possible Improvements**

* The Plane class is bare and I can improve this so that airplanes have unique names and are able to fly into different airports.  Overall I am pleased with my progess so far.

