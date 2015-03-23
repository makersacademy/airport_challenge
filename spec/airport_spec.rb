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
      plane = Plane.new
      expect(plane).to respond_to(:land)
    end

    it 'a plane can take off' do
      plane = Plane.new
      expect(plane).to respond_to(:take_off)
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:weather) { :good }
      airport.capacity.times do
        plane.land(airport)
      end
      expect { Plane.new.land(airport) }.to raise_error('all spaces are taken')
    end
  end

  context 'weather conditions' do
    it 'a plane cannot take off when there is a storm brewing' do
    end

    it 'a plane cannot land in the middle of a storm' do
      airport = Airport.new
      allow(airport).to receive(:weather) { :stormy }
      plane = Plane.new
      expect { plane.land(airport) }.to raise_error('cannot land in storm')
    end
  end
end
