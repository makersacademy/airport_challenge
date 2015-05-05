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

  let (:plane) {double :plane}
  let (:weather) {double :weather}


  it 'a plane can land' do
    expect(subject).to respond_to :land
  end

  it 'a plane can take off' do
    expect(subject).to respond_to :take_off
  end

  describe 'land' do
    it 'a plane cannot land if the airport is full' do
      allow(plane).to receive(:landed).and_return("landed")
      allow(subject).to receive(:forecast).and_return("sunny")
      capacity = subject.capacity
      capacity.times { subject.land plane }
      expect { subject.land plane }.to raise_error 'airport full, permission denied'
    end

    # it 'a plane cannot take off if the hangar is empty' do
    #   subject.hangar.count = 0
    #   expect { subject.take_off plane }.to raise_error 'no planes'
    # end

    it 'raises an error when full with default capacity' do
      expect(subject::capacity).to eq 10
    end
    it 'a plane cannot land if the weather is stormy' do
      # allow(plane).to receive(:landed).and_return("flying")
      allow(subject).to receive(:forecast).and_return("stormy")
      expect { subject.land plane }.to raise_error 'stormy weather, permission denied'
    end
      it 'a plane cannot take off if the weather is stormy or storm brewing' do
      # allow(plane).to receive(:flying).and_return("landed")
      allow(subject).to receive(:forecast).and_return("stormy")
      expect { subject.take_off plane }.to raise_error 'stormy weather, permission denied'
    end
  end

end

  # context 'traffic control' do




#     # Include a weather condition.
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy,
#     # the plane can not take off and must remain in the airport.
#     #
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport

#   context 'weather conditions' do
#     xit 'a plane cannot take off when there is a storm brewing'

#     xit 'a plane cannot land in the middle of a storm'
#   end
# end
