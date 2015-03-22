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
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  it 'have a capacity of 6 planes' do
    expect(subject.capacity).to eq 6
  end
  it 'when created has 0 planes' do
    expect(subject).to be_empty
  end
  it 'responds to land' do
    expect(subject).to respond_to :land
  end
  it 'respons to take_off' do
    expect(subject).to respond_to :take_off
  end

  context 'taking off and landing' do
    it 'plane cannot take off when no plane landed' do
      expect { airport.take_off }.to raise_error 'The plane cannot take off'
    end
    it 'plane can land' do
      airport.land(plane)
      expect(airport).not_to be_empty
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      full = airport.capacity
      full.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'The plane cannot land'
    end
    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:condition).and_return('Stormy')
        expect { airport.take_off }.to raise_error 'The plane cannot take off'
      end
      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:condition).and_return('Stormy')
        expect { aiport.land(plane).to raise_error 'The plane cannot land' }
      end
    end
  end
end
