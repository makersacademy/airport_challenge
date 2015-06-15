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

  describe 'take off' do
    
    it 'instructs a plane to take off' do 
      expect(subject).to respond_to(:release_plane).with(1).argument   
    end

    it 'releases a plane' do
      plane = double :plane
      allow(subject).to receive(:stormy?) { false }
      allow(plane).to receive (:land_at_airport) {plane}
      subject.land_plane plane
      allow(plane).to receive (:take_off) {plane}
      expect(subject.release_plane plane).to be plane
    end

    it 'does not release planes when airport is empty' do
      plane = double :plane
      expect{ subject.release_plane plane }.to raise_error 'No planes at the airport'
    end
  end

  describe 'landing' do
    
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end

    it 'receives a plane' do
      plane = double :plane, able_to_land?: true
      allow(plane).to receive(:land_at_airport) { plane }
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land_plane plane).to eq [plane]
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = double :plane, able_to_land?: true
        allow(subject).to receive(:stormy?) { false }
        allow(plane).to receive(:land_at_airport) { plane }
        Airport::DEFAULT_CAPACITY.times { subject.land_plane plane }
        expect{ subject.land_plane plane }.to raise_error 'Airport is full'
      end
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        plane = double :plane
        allow(plane).to receive(:land_at_airport) {plane}
        subject.land_plane plane
        allow(subject).to receive(:stormy?) {true}
        allow(plane).to receive(:take_off) {plane}
        expect{ subject.release_plane plane }.to raise_error 'Weather is too stormy'
      end
      
      it 'does not allow a plane to land' do
        plane = double :plane
        allow(plane).to receive(:land_at_airport) {plane}
        allow(subject).to receive(:stormy?) {true}
        expect{ subject.land_plane plane }.to raise_error 'Weather is too stormy'
      end
    end
  end
end
