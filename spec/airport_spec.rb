require 'airport'
require 'plane'

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
  let(:plane) { double :plane, flying?: true }
  before(:each) { allow(plane).to receive(:fly) }
  before(:each) { allow(plane).to receive(:land) }

  describe 'capacity' do
    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be overidden on initialize' do
      random_capacity = Random.rand(200)
      airport = described_class.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end

    it 'can only accept an integer' do
      expect { described_class.new double :fake_number }.to raise_error 'Not an integer'
    end

    it 'only accepts a positive integer' do
      random_capacity = -Random.rand(200)
      expect { described_class.new(random_capacity) }.to raise_error 'Not positive'
    end
  end

  describe '#take_off' do
    before(:each) { subject.landing plane }

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'releases a plane' do
      expect(subject.take_off).to eq plane
    end

    it 'removes the plane from the airport' do
      subject.take_off
      expect(subject).to be_empty
    end

    it 'raises an error when empty' do
      subject.take_off
      expect { subject.take_off }.to raise_error 'No planes'
    end

    it 'releases flying planes' do
      expect(plane).to receive :fly
      subject.take_off
    end
  end

  describe '#landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it 'receives a plane' do
      subject.landing plane
      expect(subject).not_to be_empty
    end

    it 'lands landed planes' do
      expect(plane).to receive :land
      subject.landing plane
    end

    it 'only allows actual planes to land' do
      expect { subject.landing double :fake_plane }.to raise_error "Not a plane"
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.landing plane }
        expect { subject.landing plane }.to raise_error 'Airport full'
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

    it 'is sunny when created' do
      expect(subject.weather).to eq 'sunny'
    end

    describe '#change_weather' do
      it 'should respond to change_weather' do
        expect(subject).to respond_to(:change_weather).with(1).argument
      end

      it 'should be sunny for 0 - 3' do
        subject.change_weather(4)
        number = rand(3)
        subject.change_weather(number)
        expect(subject.weather).to eq 'sunny'
      end

      it 'should be stormy for 4' do
        subject.change_weather(4)
        expect(subject.weather).to eq 'stormy'
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        subject.landing plane
        subject.change_weather(4)
        expect { subject.take_off }.to raise_error 'Not safe to take off'
      end

      it 'does not allow a plane to land' do
        subject.change_weather(4)
        expect { subject.landing plane }.to raise_error 'Not safe to land'
      end
    end
  end
end
