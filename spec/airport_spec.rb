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
  let(:plane) {double :plane} 

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off
    end

    it 'releases a plane' do

      subject.land(plane)
      expect(subject.take_off).to eq plane 
    end

    end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'receives a plane' do
      subject.land(plane)
      expect(subject).not_to be_empty
    end

    it 'raises error when full' do
      subject.capacity.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error "airport full"


    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'
    end
  describe 'initialize stage' do
    it 'should have a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY 
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
        subject.change_weather(6)
        expect{subject.take_off}.to raise_error "unable to take-off when stormy"
      end
      it 'does not allow a plane to land' do
        subject.change_weather(6) 
        expect{subject.land(plane)}.to raise_error "unable to land when stormy"
      end

      it "understands change weather" do
        expect(subject).to respond_to(:change_weather).with(1).argument
      end

      it "should be sunny between 0-5" do
        subject.change_weather(6)
        sunny = rand(6)
        expect(subject.change_weather(sunny)).to eq "sunny"

      end
    end
  end
end
