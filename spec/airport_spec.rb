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
let(:plane){double(:plane, land: nil, take_off: nil)}

it 'has capacity of 20 planes' do
  expect(subject.capacity).to eq 20
end

  describe 'allow_take_off' do
    it 'gives permission for plane to take off' do
      allow(subject).to receive(:forecast) {'sunny'}
      expect(subject).to respond_to(:allow_take_off)
    end

    it 'cannot release plane if empty' do
      allow(subject).to receive(:forecast) {'sunny'}
      expect {subject.allow_take_off}.to raise_error "No planes at the airport"
    end

    it 'releases plane' do
      allow(subject).to receive(:forecast) {'sunny'}
      subject.allow_land plane
      plane_count = subject.planes.count
      subject.allow_take_off
      expect(subject.planes.count).to eq (plane_count - 1)
    end
  end

  describe 'allow_landing' do
    it 'give permission for a plane to land' do
      allow(subject).to receive(:forecast) {'sunny'}
      expect(subject).to respond_to(:allow_land).with(1).argument
    end

    it 'receives a plane' do
      allow(subject).to receive(:forecast) {'sunny'}
      plane_count = subject.planes.count
      subject.allow_land plane
      expect(subject.planes.count).to eq (plane_count + 1)
    end
  end


  describe 'air traffic control' do
    context 'airport is full' do
      it 'plane cannot land' do
        allow(subject).to receive(:forecast) {'sunny'}
        subject.capacity.times {subject.allow_land plane}
        expect {subject.allow_land plane}.to raise_error "Airport is full pilot"
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
      it 'plane cannot take off' do
        allow(subject).to receive(:forecast) {'sunny'}
        subject.allow_land plane
        allow(subject).to receive(:forecast) {'stormy'}
        expect {subject.allow_take_off}.to raise_error "Soz pilot, bad weather"
      end

      it 'plane cannot land' do
        allow(subject).to receive(:forecast) {'stormy'}
        expect {subject.allow_land plane}.to raise_error "Soz, bad weather"
      end
    end
  end
end
