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

  let(:plane) {double:plane}

  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to(:take_off).with(1).argument
    end

    it 'releases a plane' do
      allow(subject).to receive(:weather) { "sunny" }
      plane1 = subject.take_off(plane)
    end
    # doubles going here bro
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:land).with(1).argument
    end

    it 'receives a plane' do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land plane
      expect(subject.hangar).not_to be_empty
    end

    it 'does not allow a plane to land that has already landed' do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect { subject.land plane }.to raise_error "That plane is already in the hangar"
    end
    # doubles going here bro
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather) { "sunny" }
        subject.capacity.times { subject.land(Plane.new)}
        expect { subject.land(plane)}.to raise_error "Hangar full, no landing"
      end
    end

    it 'has a hangar capacity' do
      expect(subject.capacity).to eq(Airport::HANGAR_CAPACITY)
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
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.take_off plane }.to raise_error "It's stormy, no taking off"
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.land(plane)}.to raise_error "It's stormy, no landing"
      end
    end
  end
end
