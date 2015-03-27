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

# Include a weather condition.
# The weather must be random and only have two states "sunny" or "stormy".
# Try and take off a plane, but if the weather is stormy,
# the plane can not take off and must remain in the airport.
#
# This will require stubbing to stop the random return of the weather.
# If the airport has a weather condition of stormy,
# the plane can not land, and must not be in the airport

describe Airport do

  let(:plane) { double(:plane, take_off: true, ground: false) }

  it 'have a capacity of 6 planes' do
    expect(Airport::CAPACITY).to eq 6
  end
  it 'when created has 0 planes' do
    expect(subject).to be_airport_empty
  end

  context 'traffic control' do

    context 'depending on capacity but good weather' do

      before { allow(subject).to receive(:poor_weather?).and_return(false) }

      it 'plane cannot take off when no plane landed' do
        allow(subject).to receive(:airport_empty?).and_return(true)
        expect { subject.take_off(plane) }.to raise_error 'Airport is empty'
      end

      it 'plane can land when airport is not full' do
        allow(subject).to receive(:airport_full?).and_return(false)
        expect { subject.land(plane) }.not_to raise_error
      end

      it 'a plane cannot land if the airport is full' do
        allow(subject).to receive(:airport_full?).and_return(true)
        expect { subject.land(plane) }.to raise_error 'Airport is full'
      end
    end

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:poor_weather?).and_return(false)
        subject.land(plane)
        allow(subject).to receive(:poor_weather?).and_return(true)
        expect { subject.take_off(plane) }.to raise_error 'Poor weather, not transit'
      end
      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:weather).and_return('Stormy')
        expect { subject.land(plane) }.to raise_error 'Poor weather, not transit'
      end
    end
  end
end
