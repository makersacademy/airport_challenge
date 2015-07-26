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
  let(:plane){double :plane, flying?: true}

  describe 'ariving' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to :ariving
    end

    it 'receives a plane' do
      allow(subject).to receive(:set_weather){"Sunny"}
      allow(plane).to receive(:land)

      subject.ariving(plane)
      expect(subject).to_not be_empty
    end

    it "plane should land on arival" do
      allow(subject).to receive(:set_weather){"Sunny"}

      plane = spy :plane
      subject.ariving(plane)
      expect(plane).to have_received(:land)
    end
  end

  describe 'leaving' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :leaving
    end

    it 'releases a plane' do
      allow(subject).to receive(:set_weather){"Sunny"}
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)

      subject.ariving(plane)
      subject.leaving
      expect(subject).to be_empty
    end

    it "plane should take off on leaving" do
      allow(subject).to receive(:set_weather){"Sunny"}

      plane = spy :plane
      subject.ariving(plane)
      subject.leaving
      expect(plane).to have_received(:take_off)
    end
  end

  context 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:set_weather){"Sunny"}
        allow(plane).to receive(:land)

        subject.capacity.times {subject.ariving(plane)}
        expect{subject.ariving(plane)}.to raise_error "Cannot land, airport full"
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
        allow(subject).to receive(:set_weather){"Sunny"}
        allow(plane).to receive(:land)

        subject.ariving(plane)

        allow(subject).to receive(:set_weather){"Stormy"}

        expect{subject.leaving}.to raise_error "Cannot take off, weather conditions too bad"
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:set_weather){"Stormy"}

        expect{subject.ariving(plane)}.to raise_error "Cannot land, weather conditions too bad"
      end 
    end
  end
end