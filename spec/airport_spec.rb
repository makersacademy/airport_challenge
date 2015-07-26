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
  let(:plane) { double :plane }
  before(:each) { allow(plane).to receive(:land) }
  before(:each) { allow(plane).to receive(:fly) }

  describe 'take off' do
    xit 'instructs a plane to take off'
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off
    end

    xit 'releases a plane'
  end
    it "releases a plane" do
      subject.landing(plane)
      expect(subject.take_off).to eq plane
    end

    it "cannot release a plane in empty airport" do
      expect{subject.take_off}.to raise_error "Airport empty"
    end

    describe 'landing' do
      xit 'instructs a plane to land'

    it "ensures that taken off plane status is flying" do
      subject.landing(plane)
      expect(plane).to receive :fly
      subject.take_off
    end

    xit 'receives a plane'


  describe "initialized stage" do
    it "has a default capacity when initialized" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'

  describe "#landing" do
    it "instructs a plane to land" do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it "receives a plane" do
      subject.landing(plane)
      expect(subject).not_to be_empty
    end

    it "ensures that landed plane status is landing" do
      expect(plane).to receive :land
      subject.landing(plane)
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
      xit 'does not allow a plane to take off'

  describe "traffic control" do
    context "when airport is full" do
      it "does not allow a plane to land" do
        subject.capacity.times { subject.landing(plane) }
        expect{subject.landing(plane)}.to raise_error "Airport is full"
      end
    end

    context "weather status randomization" do
      it "should be sunny between 0 - 2" do
        subject.randomize_weather(3)
        sunny = rand(3)
        expect(subject.randomize_weather(sunny)).to eq "sunny"
      end

      xit 'does not allow a plane to land'

      it "should be stormy between 3 - 4" do
        subject.randomize_weather(0)
        stormy = 3 + rand(2)
        expect(subject.randomize_weather(stormy)).to eq "stormy"
      end
    end

    context "when weather conditions are stormy" do
      it "recognizes the change weather method" do
        expect(subject).to respond_to(:randomize_weather).with(1).argument
      end

      it "does not allow a plane to take off in storm" do
        subject.landing(plane)
        subject.randomize_weather(4)
        expect{ subject.take_off }.to raise_error "Can't take off in storm"
      end

      it "does not allow a plane to land in storm" do
        allow(plane).to receive :fly
        subject.randomize_weather(4)
        expect{ subject.landing(plane) }.to raise_error "Can't land in storm"
      end
    end
  end

end
