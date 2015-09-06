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

  let (:plane) {double('plane', flying?: true, land: false, take_off: true) }

  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to(:plane_take_off)
    end

    it 'releases a plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.plane_land(plane)
      subject.plane_take_off
      expect(subject.planes.empty?).to eq(true)
    end

    it 'raises an error when no planes at the airport' do
      expect { subject.plane_take_off }.to raise_error
      'Cannot currently take off'
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:plane_land).with(1).argument
    end

    it 'receives a plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.plane_land(plane)
      expect(subject.planes.any?).to eq(true)
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.capacity.times { subject.plane_land(plane) }
        expect { subject.plane_land(plane) }.to raise_error
        'Plane cannot currently land at airport'
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
      it 'creates stormy conditions' do
        expect(subject).to respond_to(:stormy?)
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?).and_return(true)
        expect { subject.plane_land(plane) }.to raise_error
        'Plane cannot currently land at airport'
      end

      it 'does not allow a plane to take off' do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.plane_land(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect { subject.plane_take_off}.to raise_error
        'Cannot currently take off'
      end
    end
  end
end
