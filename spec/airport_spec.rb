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

  describe 'take off' do
# xit 'instructs a plane to take off'
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off
    end
# xit 'releases a plane'
    it 'releases a plane' do
      plane = Plane.new
      subject.land plane
      expect(plane.flying?).to eq false
      subject.take_off plane
      expect(plane.flying?).to eq true
      expect(@planes).to eq nil
    end
    
   
  end

  describe 'landing' do
# xit 'instructs a plane to land'
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
#xit 'receives a plane'
    it 'receives a plane' do
      plane = Plane.new
      subject.land plane
      expect(plane.landed?).to eq true
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
# xit 'does not allow a plane to land'
      it 'does not allow a plane to land' do
        plane = Plane.new
        subject.capacity.times {subject.land(plane)}
        expect{ subject.land(plane) }.to raise_error "#{subject.class.name} is full" if :full?
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
# xit 'does not allow a plane to take off'
      it 'does not allow a plane to take off' do
      plane = Plane.new
      subject.land plane
      subject.random_weather(3)
      expect{ subject.take_off plane }.to raise_error "Weather is stormy. You may not take off from #{subject.class.name}"
    end
# xit 'does not allow a plane to land'
      it 'does not allow a plane to land' do
        subject.random_weather(3)
        plane = Plane.new
        expect{ subject.land plane }.to raise_error "Weather is stormy. You may not land at #{subject.class.name}"
      end
    end
  end
end
