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
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }

  # describe '#land' do
  it { is_expected.to respond_to(:land).with(1).argument }
  # end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe 'land' do
    it 'fails when the airport is full' do
      airport.land(plane)
      error = 'Cannot land since airport is full'
      expect { airport.land(double :plane) }.to raise_error error
    end

    it 'fails when the airport is full to a given capacity' do
      airport = Airport.new(capacity: 2)
      2.times { airport.land double :plane }
      error = 'Cannot land since airport is full'
      expect{ airport.land(plane) }.to raise_error error
    end
  end

  describe 'take off' do
    it 'does not take off a plane that is not in the airport' do
      error = 'The plane is not currently landed at this airport'
      expect { airport.take_off(plane) }.to raise_error error
    end
  end
  
  context 'when stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'does not allow a plane to land' do
      error = 'Unable to land due to stormy weather'
      expect{ airport.land(plane) }.to raise_error error
    end

    it 'does not allow a plane to take off' do
      error = 'Unable to take off due to stormy weather'
      expect{ airport.take_off(plane) }.to raise_error error
    end
  end

  # describe 'take off' do
  #   xit 'instructs a plane to take off'

  #   xit 'releases a plane'
  # end

  # describe 'landing' do
  #   xit 'instructs a plane to land'

  #   xit 'receives a plane'
  # end

  # describe 'traffic control' do
  #   context 'when airport is full' do
  #     xit 'does not allow a plane to land'
  #   end

  #   # Include a weather condition.
  #   # The weather must be random and only have two states "sunny" or "stormy".
  #   # Try and take off a plane, but if the weather is stormy,
  #   # the plane can not take off and must remain in the airport.
  #   #
  #   # This will require stubbing to stop the random return of the weather.
  #   # If the airport has a weather condition of stormy,
  #   # the plane can not land, and must not be in the airport

  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'

  #     xit 'does not allow a plane to land'
  #   end
  # end
end
