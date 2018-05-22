# Airport Challenge
### [Makers Academy](https://www.makersacademy.com) - Week 2 Individual Project


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

## Outline
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. 

## The Task
I used this project to further my understanding of TDD using RSpec. I explored mocks and stubs as a way to improve the performance of my tests and avoid testing dependencies. This project could be expanded to guard against edge cases, many of which have not been accounted for as of yet. 

## User Stories
```
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

### Airport RSpec File
```
require 'airport'

describe Airport do
  let(:plane) { instance_double('Plane')}
  let(:weather) { instance_double('Weather') }
  let(:subject) { described_class.new(weather) }

  context 'When space is available at the airport' do
    context 'When the weather is sunny' do
      before do
        allow(weather).to receive(:todays_weather).and_return('sunny')
      end
      it 'allows the plane to land' do
        subject.land(plane)
        expect(subject.hanger).to include(plane)
      end

      it 'confirms the weather is sunny' do
        expect(subject.weather_at_airport).to eq 'sunny'
      end

      it 'can instruct an airplane to take off' do
        expect(subject).to respond_to(:takeoff)
      end

      it 'confirms that plane that took off is no longer in hanger' do
        subject.land(plane)
        taken_off_plane = subject.takeoff
        expect(subject.hanger).to_not include(taken_off_plane)
      end
    end

    context 'When weather is stormy' do
      before do
        allow(weather).to receive(:todays_weather).and_return('stormy')
      end

      it 'does not allow a plane to land' do
        subject.land(plane)
        expect(subject.hanger).to_not include(plane)
      end

      it 'reports that plane is unable to land because of the weather' do
        expect(subject.land(plane)).to eq 'You cannot land due to the weather'
      end

      it 'does not allow a plane to take off' do
        subject.hanger << plane
        subject.takeoff
        expect(subject.hanger).to include(plane)
      end

      it 'reports that plane is unable to takeoff because of the weather' do
        expect(subject.takeoff).to eq 'You cannot takeoff due to the weather'
      end
    end
  end

  context 'When airport hanger is full' do
    it 'does not allow a plane to land' do
      allow(weather).to receive(:todays_weather).and_return('sunny')
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect(subject.land(plane)).to eq('Airport is full')
    end
  end
end
```

### Weather RSpec File
```
require 'weather'

describe Weather do
  describe '#todays_weather' do
    it 'checks the weather' do
      expect(subject.todays_weather).to_not be_nil
    end
  end
end
```
### Airport Ruby Code
```
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :hanger, :capacity, :weather

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @hanger = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    return 'You cannot land due to the weather' if weather_at_airport == 'stormy'
    return 'Airport is full' if full?
    hanger.push(plane)
  end

  def full?
    hanger.count >= @capacity
  end

  def include?(plane)
    hanger.include?(plane)
  end

  def takeoff
    return 'You cannot takeoff due to the weather' if weather_at_airport == 'stormy'
    @hanger.pop
  end

  def weather_at_airport
    weather.todays_weather
  end
end
```

### Weather Ruby Code
```
class Weather
  def todays_weather
    ["sunny", "stormy"].sample
  end
end
```
