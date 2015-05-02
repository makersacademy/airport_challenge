require 'airport'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:plane) { double :plane, takeoff: true, land: false }

  context 'taking off and landing' do

    it 'a plane can land' do
      subject.receive plane
      planes = subject.planes
      expect(planes.include? plane).to be true
    end

    it 'a plane can take off' do
      subject.receive plane
      subject.launch plane
      planes = subject.planes
      expect(planes.include? plane).to be false
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      subject.capacity.times { subject.receive double :plane, land: true }
      expect { subject.receive double :plane, land: true }.to raise_error 'airport cannot receive planes when at capacity'
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

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
