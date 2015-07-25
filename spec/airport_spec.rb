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

# To-do
# -----
# I need to find a way to default weather to sunny, and then set stormy?
# to true just for the context in which the severe weather's effect is being
# tested

describe Airport do

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off
    end

    it 'releases a plane' do
      allow(subject).to receive(:stormy?) { false }
      subject.landing Plane.new
      plane = subject.take_off
      expect(plane).to be_a Plane
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it 'receives a plane' do
      allow(subject).to receive(:stormy?) { false }
      plane = double :plane
      subject.landing plane
      expect(subject.planes).to include(plane)
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?) { false }
        10.times { subject.landing :plane }
        expect { subject.landing :plane }.to raise_error 'Airport full. Unable to land'
      end
    end

    context 'when airport is empty' do
      it 'does not allow a plane to take off' do
        expect { subject.take_off }.to raise_error 'Airport empty. No planes to taxi'
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
        allow(subject).to receive(:stormy?) { false }
        subject.landing :plane
        allow(subject).to receive(:stormy?) { true }
        expect { subject.take_off }.to raise_error 'Severe weather. Unable to take off'
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?) { true }
        expect { subject.landing :plane }.to raise_error 'Severe weather. Unable to land'
      end

    end
  end
end
