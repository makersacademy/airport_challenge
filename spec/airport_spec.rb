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

  let(:airport) {Airport.new}

  context 'taking off and landing' do

    it {is_expected.to respond_to :land}
    #it it {is_expected.to respond_to :takeoff}
  end

  describe 'traffic control' do
    it 'raises an error to pilot as plane cannot land if the airport is full' do
      plane = double :plane
      allow(plane).to receive(:land) { true }
      7.times { airport.land plane }
      expect {airport.land plane}.to raise_error 'Airport full, remain in stack'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

=begin
    context 'weather conditions' do
      it 'a plane cannot land in the middle of a storm' do
        allow(plane).to receive(:land) { true }
        allow(subject).to receive(:stormy?) { true }
         expect { airport.land plane }.to raise_error 'Weather stormy, proceed to alternate airport'
    end
      xit 'a plane cannot  off when there is a storm brewing'
=end
      
  end
end

