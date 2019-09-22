require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }

  describe '#land' do
  
    it 'has a plane once it has landed' do
      subject
      plane = Plane.new
      allow(subject).to receive(:weather).and_return(:sunny)
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'raises an error if a plane that has landed tries to land again' do
      plane = Plane.new
      subject
      airport.land(plane)
      allow(subject).to receive(:weather).and_return(:sunny)
      expect { airport.land(plane) }.to raise_error('Error: You have already landed this plane')
    end

    it 'raises an error if the weather is too stormy to land' do
      subject
      plane = Plane.new
      allow(subject).to receive(:weather_generator).and_return(:stormy)
      expect { subject.land(plane) }.to raise_error('Error: Too stormy')
    end
  end

  describe '#take_off' do

    it 'deletes plane from array on take_off' do
      subject
      plane = Plane.new
      allow(subject).to receive(:weather_generator).and_return(:sunny)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes.find { |planes| plane }).to eq nil
    end

    it 'raises an error if a plane that has taken off tries to take off again' do
      subject
      plane = Plane.new
      allow(subject).to receive(:weather_generator).and_return(:sunny)
      airport.take_off(plane)
      expect(subject.weather).to eq :sunny
      expect { airport.take_off(plane) }.to raise_error('Error: You have already taken off')
    end

    it 'raises an error if the weather is too stormy to take-off' do
      subject
      plane = Plane.new
      allow(subject).to receive(:weather_generator).and_return(:stormy)
      expect { subject.take_off(plane) }.to raise_error('Error: Too stormy')
    end
  end
  
  describe '#weather' do
    it 'allows aiports to check the weather' do
        allow(subject).to receive(:weather_generator).and_return(:stormy)
        expect(subject.weather_generator).to eq :stormy
    end  
    
    it 'generates a weather forecast of either sunny or stormy' do
      subject.stub(:weather_generator).and_return(:sunny)
      expect(subject.weather).to eq :sunny
    end
  end
end
