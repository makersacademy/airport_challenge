require 'airport'

describe Airport do

  context 'taking off and landing' do

    it 'a plane can land' do
      allow(subject).to receive(:weather_check).and_return(:sunny)
      plane = double(:plane)
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    # A plane currently in the airport can be requested to take off.
    it 'a plane can take off' do
      allow(subject).to receive(:weather_check).and_return(:sunny)
      plane = double(:plane)
      subject.land(plane)
      subject.launch(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  context 'traffic control' do

    # No more planes can be added to the airport, if it's full.
    # It is up to you how many planes can land in the airport
    # and how that is implemented.
    it 'a plane cannot land if the airport is full' do
      # change capacity to 20. assumption in rest of tests is that
      # capacity is at least 1
      subject.capacity = 20
      allow(subject).to receive(:weather_check).and_return(:sunny)
      plane = double(:plane)
      20.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error('Airport full')
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    # Note that this test checks launch error, doesn't check ongoing
    # landed status of plane
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:weather_check).and_return(:sunny)
        plane = double(:plane)
        subject.land(plane)
        allow(subject).to receive(:weather_check).and_return(:stormy)
        expect { subject.launch(plane) }.to raise_error('Stormy weather')
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:weather_check).and_return(:stormy)
        plane = double(:plane)
        expect { subject.land(plane) }.to raise_error('Stormy weather')
      end
    end
  end
end
