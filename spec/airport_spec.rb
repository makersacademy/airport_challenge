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

it { is_expected.to respond_to :release_plane }

it { is_expected.to respond_to(:land).with(1).argument }


  describe 'take off' do

    #THIS TEST IS PROBLEMATIC ----ASK FOR HELP
    it 'instructs a plane to take off' do
      plane = double :plane, landing: false
      allow(subject).to receive(:weather){'sunny'}
      subject.land plane
      expect(plane).to receive :take_off
      subject.release_plane plane
    end

    it 'releases a plane' do
      plane = double :plane, take_off: true, landing: false
      allow(subject).to receive(:weather){"sunny"}
      subject.land plane
      expect(subject.release_plane plane).to be plane
    end

    describe 'landing' do

      it 'instructs plane to land - receives a plane' do
        plane = Plane.new
        subject.land plane
        expect(subject).not_to be_empty
      end

    end
  end
  describe 'traffic control' do

    it 'there is a DEFAULT capacity' do
      expect(subject.capacity).to eq Airport::CAPACITY
    end 
    
    context 'when airport is full' do

      #THIS TEST IS PROBLEMATIC ---- ASK FOR HELP
      it 'does not allow a plane to land' do
        plane = double :plane, landing: false
        allow(subject).to receive(:weather){:sunny}
        subject.capacity.times{subject.land plane}
        expect{subject.land plane}.to raise_error 'Airport is full' 
      end

    describe 'Include a weather condition.' do
    
      it {is_expected.to respond_to :stormy?}
    end
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy,
#     # the plane can not take off and must remain in the airport.
#     #
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport

#     context 'when weather conditions are stormy' do
#       xit 'does not allow a plane to take off'

#       xit 'does not allow a plane to land'
    end
  end
end
