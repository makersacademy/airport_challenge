require 'airport'

describe Airport do

  describe 'entity' do
    it 'when created has an empty array of planes' do
      expect(subject.planes).to eq([])
    end
  end

  describe 'traffic management procedures' do
    it 'can land a plane' do
      plane = Plane.new
      port = subject 
      port.land(plane)
      expect(port.planes.last).to eq(plane)
    end
    it 'can takeoff a plane' do

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
