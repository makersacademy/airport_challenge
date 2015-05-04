require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  context 'taking off and landing' do

    it 'a plane can land' do
      # override weather!!!
      allow(subject).to receive(:weather_check).and_return(:sunny)
      plane = double(:plane)
      subject.land (plane)
      expect(subject.planes).to include(plane)
    end


    it 'a plane can take off' do
      #override weather!!!
      allow(subject).to receive(:weather_check).and_return(:sunny)
      plane = double(:plane)
      subject.land (plane)
      subject.launch (plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      # change capacity to a specific amount. assumption in rest
      # of tests is that capacity is at least 6, but we need a set
      # figure for this particular test
      subject.capacity = 20
      allow(subject).to receive(:weather_check).and_return(:sunny)
      plane = double(:plane)
      20.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error('Airport full')

    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'
      #allow(subject).to receive(:weather_check).and_return(:stormy)


      xit 'a plane cannot land in the middle of a storm'
      #allow(subject).to receive(:weather_check).and_return(:stormy)

    end
  end
end
