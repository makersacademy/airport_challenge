require 'airport'

describe Airport do
  number = 20

  subject(:port) { described_class.new }
  subject(:port_over) { described_class.new(20) }
  subject(:port_capacity) { described_class.new(number) }

  describe 'entity' do
    it 'when created has an empty array of planes' do
      expect(port.planes).to eq([])
    end
  end

  describe 'traffic management procedures: landing' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'can land a plane' do
      plane = instance_double("Plane")
      port.land(plane)
      expect(port.planes.last).to eq(plane)
    end
    message = "The airport is full"
    it 'raises an error if the airport is full' do
      plane = instance_double("Plane")
      port_over.capacity.times {port_over.land(plane)}
      expect {port_over.land(plane)}.to raise_error(message)
    end
  end

  describe 'traffic management procedures: takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it 'can takeoff a plane' do
      plane1 = instance_double("Plane")
      port.land(plane1)
      plane2 = instance_double("Plane")
      port.land(plane2)
      expect(port.takeoff(plane1)).to eq(plane1)
      expect(port.planes).to eq([plane2])
    end
    message = "There is no such plane in the airport"
    it 'raises an error if the airport is empty' do
      plane = instance_double("Plane")
      expect {subject.takeoff(plane)}.to raise_error(message)
    end
    it 'raises the same error if the airport does not have this plane' do
      plane1 = instance_double("Plane")
      plane2 = instance_double("Plane")
      port.land(plane1)
      expect {subject.takeoff(plane2)}.to raise_error(message)
    end
  end

  describe 'capacity' do
    it 'by default capacity is constant' do
      expect(port.capacity).to eq(Airport::CAPACITY)
    end
    it 'capacity can be overridden' do
      expect(port_capacity.capacity).to eq(number)
    end
  end

end
