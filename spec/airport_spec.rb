require 'airport'

describe Airport do

  describe 'entity' do
    it 'when created has an empty array of planes' do
      expect(subject.planes).to eq([])
    end
  end

  describe 'traffic management procedures: landing' do
    it 'can land a plane' do
      plane = Plane.new
      port = subject
      port.land(plane)
      expect(port.planes.last).to eq(plane)
    end
    message = "The airport is full"
    it 'raises an error if the airport is full' do
      port = Airport.new(20)
      port.capacity.times {port.land(Plane.new)}
      expect {port.land(Plane.new)}.to raise_error(message)
    end
  end

  describe 'traffic management procedures: takeoff' do
    it 'can takeoff a plane' do
      port = subject
      plane1 = Plane.new
      port.land(plane1)
      plane2 = Plane.new
      port.land(plane2)
      expect(port.takeoff(plane1)).to eq(plane1)
      expect(port.planes).to eq([plane2])
    end
    message = "There is no such plane in the airport"
    it 'raises an error if the airport is empty' do
      expect {subject.takeoff(Plane.new)}.to raise_error(message)
    end
    it 'raises the same error if the airport does not have this plane' do
      plane = Plane.new
      port = subject
      port.land(plane)
      expect {subject.takeoff(Plane.new)}.to raise_error(message)
    end
  end

  describe 'capacity' do
    it 'by default capacity is constant' do
      expect(subject.capacity).to eq(Airport::CAPACITY)
    end
    it 'capacity can be overridden' do
      number = 20
      port = Airport.new(number)
      expect(port.capacity).to eq(number)
    end
  end

end
