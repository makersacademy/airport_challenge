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

  context 'taking off and landing' do

    it 'a plane can land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'a plane can take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end

  context 'traffic control' do

    let (:airplane) { double(:airplane) }

    it 'a plane cannot land if the airport is full' do
      allow(airplane).to receive(:status=) { "landed" }
      allow(subject).to receive(:storm_brewing) { 'sunny' }
      capacity = subject::capacity
      capacity.times { subject.land(airplane) }
      expect { subject.land(airplane) }.to raise_error 'The airport is full'
    end

    it 'a plane cannot land if the airport is full with extended capacity' do
      allow(airplane).to receive(:status=) { "landed" }
      heathrow = Airport.new(5)
      allow(heathrow).to receive(:storm_brewing) { 'sunny' }
      capacity = heathrow::capacity
      capacity.times { heathrow.land(airplane) }
      expect { heathrow.land(airplane) }.to raise_error 'The airport is full'
    end

    it 'a plane cannot land if the airport is empty' do
      allow(subject).to receive(:storm_brewing) { 'sunny' }
      expect { subject.take_off }.to raise_error 'Airport is empty'
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
        allow(subject).to receive(:storm_brewing) { 'sunny' }
        plane = Plane.new
        subject.land(plane)
        allow(subject).to receive(:storm_brewing) { 'stormy' }
        expect { subject.take_off(plane) }.to raise_error
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:storm_brewing) { 'stormy' }
        expect { subject.land(Plane.new) }.to raise_error
      end

      it 'responds to storm_brewing method' do
        expect(subject).to respond_to :storm_brewing
      end
    end
  end
end
