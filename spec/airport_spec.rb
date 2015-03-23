require 'airport'

# A plane currently in the airport can be requested to take off.

describe Airport do
  let(:plane) { Plane.new }
  context 'airport must approve' do
    xit 'when a plane is landing'

    xit 'when a plane is taking off'
  end

  context 'appropriate plane status checks' do
    it 'when a plane is landed, it cannot land' do
      plane.land
      expect { plane.land }.to raise_error 'Plane already landed.'
    end
    it 'when a plane is flying, it cannot take off' do
      plane.land
      plane.take_off
      expect { plane.take_off }.to raise_error 'Plane already flying.'
    end
  end

  context 'traffic control checks' do
    it 'can check capacity' do
      expect(subject.agree_land :plane).to be nil
    end

    it 'a plane cannot land if the airport is full' do
      10.times { subject.agree_land double :plane, @status == 'flying' }
      expect { subject.agree_land double :plane, @status == 'flying' }.to raise_error 'Airport is full.'
    end
  end

  # Include a weather condition.
  # The weather must be random and only have two states "sunny" or "stormy".
  # Try and take off a plane, but if the weather is stormy,
  # the plane can not take off and must remain in the airport.
  # This will require stubbing to stop the random return of the weather.
  # If the airport has a weather condition of stormy,
  # the plane can not land, and must not be in the airport

  context 'weather condition checks' do
    xit 'a plane cannot take off when there is a storm brewing'

    xit 'a plane cannot land in the middle of a storm'
  end
end
