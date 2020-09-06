require 'airport_class'
require 'plane_class'

describe Airport do

  describe 'Airport initialize' do

    it 'initialises Aiport with array to store planes' do
      expect(subject.hangar).to be_an_instance_of(Array)
    end

    it 'initialises Airport with custom capacity' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end

    it 'initialises Airport with DEFAULT_CAPACITY' do
      airport = Airport.new
      expect(airport.capacity).to eq Airport:: DEFAULT_CAPACITY
    end

  end

  describe 'take-off' do

    it 'allows planes to depart airport' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms plane has departed airport' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.departed?(plane)).to eq true
    end

  end

  describe 'landing' do

    it 'allows plane to land at airport' do
      expect(subject).to respond_to :land
    end

    it 'airport responds to full?' do
      expect(subject.full?).to eq false
    end

    it 'prevents plane landing if airport hangar is at capacity' do
      airport = Airport.new(1)
      plane = Plane.new
      plane1 = Plane.new
      airport.land(plane)
      expect { airport.land(plane1) }.to raise_error("Landing prohibited. Airport hangar is at capacity.")
    end

  end

end
