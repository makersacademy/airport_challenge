require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }

  describe '#land' do
    
    it 'lands a plane at an airport' do
      subject
      plane = Plane.new
      airport.land(plane)
      expect(airport).to respond_to(:land).with(1).argument
    end
  
    it 'has plane once it has landed' do
      subject
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'raises an error if a plane that has landed tries to land again' do
      plane = Plane.new
      subject
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error('Error: You have already landed this plane')
    end
  end

  describe '#take_off' do

    it 'deletes plane from array on take_off' do
      subject
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes.find { |planes| plane }).to eq nil
    end

    it 'raises an error if a plan that has taken off tries to take off again' do
      subject
      plane = Plane.new
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error('Error: You have already taken off')
    end
  end 
end
