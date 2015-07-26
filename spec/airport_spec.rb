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

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#take_off?' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off?
    end


    it 'releases a plane' do
      expect(subject.instance_variable_get(:@planes)).to eql([])
      expect { subject.take_off?}.to raise_error 'Can not take off'
    end
   end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to :landing?
    end

    it 'receives a plane' do
      expect(subject.stub(:full?))
      expect { subject.landing?}.to raise_error 'Can not land plane'
    end

  end

  describe 'traffic control' do
      context 'when airport is full' do
        it 'does not allow a plane to land' do
          subject.capacity.times { subject.airport Airport.new }
          expect { subject.airport Airport.new }.to raise_error 'Airport is full'
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
          allow(subject).to receive(:weather?) {"stormy"}
          expect { subject.landing?}.to raise_error 'Can not land plane'
        end

        it 'does not allow a plane to land' do
          allow(subject).to receive(:weather?) {"stormy"}
          expect { subject.take_off?}.to raise_error 'Can not take off'
        end

      end
    end
end
