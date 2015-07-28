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
  let(:plane) { double(:airplane) }
  let(:weather) { double(:weather) }
  subject { Airport.new(weather)}

  describe '#request_take_off' do
    before(:each) do
      allow(weather).to receive(:weather_report) { "sunny" }
      allow(plane).to receive(:land)
      subject.request_landing plane
      allow(plane).to receive(:fly)
    end

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:request_take_off)
    end

    it 'releases a plane' do
      expect(subject.request_take_off).to eq(plane)
    end

    it 'after releasing a plane' do
      subject.request_take_off
      expect(subject.planes).to be_empty
    end

    it 'only allows take off if there is a plane available' do
      subject.request_take_off
      expect { subject.request_take_off }.to raise_error
      "There are currently no planes ready for take off."
    end
  end

  describe '#request_landing' do
    before(:each) do
      allow(weather).to receive(:weather_report) { "sunny" }
      allow(plane).to receive(:land)
    end

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:request_landing).with(1).argument
    end

    it 'receives a plane' do
      expect(subject.request_landing plane).to eq(plane)
    end

    it 'after accepting a plane' do
      subject.request_landing plane
      expect(subject.planes).not_to be_empty
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      before(:each) do
        allow(weather).to receive(:weather_report) { "sunny" }
        allow(plane).to receive(:land)
      end
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.request_landing plane }
        expect { subject.request_landing plane }.to raise_error
        "Airport at capacity!  You can not land here!"
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
      before(:each) do
        allow(weather).to receive(:weather_report) { "stormy" }
      end
      it 'does not allow a plane to take off' do
        expect { subject.request_take_off }.to raise_error
        "You can not take off!  The weather is stormy!"
      end

      it 'does not allow a plane to land' do
        expect { subject.request_landing plane }.to raise_error
        "You can not land!  The weather is stormy!"
      end
    end
  end
end
