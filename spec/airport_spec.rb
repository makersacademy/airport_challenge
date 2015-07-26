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
  it 'initiates with default capacity' do
    expect(subject.capacity).to eq Airport::D_CAPACITY
  end

  it 'takes custom capacity' do
    random = Random.rand(100)
    subject = described_class.new random
    expect(subject.capacity).to eq random
  end

  it 'defaults to sunny weather' do
    expect(subject.sunny).to eq true
  end

  it 'can take non-sunny weather' do
    subject = described_class.new(50, false)
    expect(subject.sunny).to eq false
  end

  describe 'take off' do
    it { is_expected.to respond_to :take_off }

    it 'releases a plane' do
      plane = double :plane
      subject.landing plane
      expect(subject.take_off).to be plane
    end
  end

  describe 'landing' do
    it { is_expected.to respond_to(:landing).with(1).argument }

    it 'receives a plane' do
      subject.landing double :plane
      expect(subject).not_to be_empty
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.landing double :plane }
        expect { subject.landing double :plane }.to raise_error('Airport full')
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
        plane = double :plane
        subject.landing plane
        subject.sunny = false
        expect { subject.take_off }.to raise_error('Weather is bad for take off')
      end

      it 'does not allow a plane to land' do
        plane = double :plane
        subject = described_class.new(50, false)
        expect { subject.landing plane }.to raise_error('Weather is bad for landing')
      end
    end
  end
end
