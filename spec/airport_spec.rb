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
  let(:plane){double(:airplane)}
  # let(:flying_plane){double(:airplane, {:flying? => true})}

  describe 'take off' do
    before(:each) do
      allow(plane).to receive(:land)
      subject.accept plane
      allow(plane).to receive(:fly)

    end

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:allow_take_off)
    end

    it 'releases a plane' do
      expect(subject.allow_take_off).to eq(plane)
    end

    it 'after releasing a plane' do
      subject.allow_take_off
      expect(subject.planes).to be_empty
    end

    it 'only allows take off if there is a plane available' do
      subject.allow_take_off
      expect{subject.allow_take_off}.to raise_error "There are currently no planes ready for take off."
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:accept).with(1).argument
    end

    it 'receives a plane' do
      allow(plane).to receive(:land)
      expect(subject.accept plane).to eq(plane)
    end

    it 'after accepting a plane' do
      allow(plane).to receive(:land)
      subject.accept plane
      expect(subject.planes).not_to be_empty
    end
  end

  describe 'capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      before(:each) do
        allow(plane).to receive(:land)
      end
      it 'does not allow a plane to land' do
        subject.capacity.times{subject.accept plane}
        expect{subject.accept plane}.to raise_error "Airport at capacity!  You can not land here!"
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
      #let(:stormy_weather){double(:weather, :stormy)}
      it 'does not allow a plane to take off' do
        allow(plane).to receive(:land)
        subject.accept plane
        allow(plane).to receive(:fly)

        expect{subject.allow_take_off}.to raise_error "You can not take off!  The weather is stormy!"
      end

      xit 'does not allow a plane to land'
    end
  end
end
