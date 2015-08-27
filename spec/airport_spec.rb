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

  let (:plane){double(:plane)}

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off
    end

    it 'releases a plane' do
      terminal = Airport.new
      plane = :plane
      terminal.land plane
      expect(terminal.take_off).to eq plane
    end

  end

  describe '#land' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'receives a plane' do
      plane = :plane
      expect(subject.land plane).not_to be_empty
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        terminal = Airport.new
        terminal.capacity.times { terminal.land :plane }
        expect { terminal.land :plane }.to raise_error 'Airport is full'
      end
    end
    it 'returns error if no planes available' do
      expect { subject.take_off }.to raise_error 'No planes available'
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
        terminal = Airport.new
        plane = :plane
        terminal.land plane
        terminal.weather(4)
        expect { terminal.take_off }.to raise_error 'Stormy, can not take off'
      end

      it 'does not allow a plane to land' do
        terminal = Airport.new
        plane = :plane
        terminal.weather(4)
        expect { terminal.land plane }.to raise_error 'Stormy, can not land'
      end
    end
  end
end
