require 'airport'

describe Airport do
  context '#initialize' do
    it 'allows user to set override default capacity' do
      airport = Airport.new(77)
      expect(airport.capacity).to eq(77)
    end
  end

  context '#land' do
    it 'can be called on an Airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'adds a Plane to the Airport array' do
      allow(subject).to receive(:weather) { 'sunny' }
      expect { subject.land(Plane.new) }.to change { subject.planes.length }.by(1)
    end

    it 'changes Plane landed attribute to true' do
      allow(subject).to receive(:weather) { 'sunny' }
      planes_to_land = Array.new(3) { Plane.new }
      
      planes_to_land.each do |plane|
        expect { subject.land(plane) }.to change { plane.landed }.from(false).to(true)
      end
    end

    it 'raises an error when the Airport is full' do
      allow(subject).to receive(:weather) { 'sunny' }
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error('Cannot land, Airport at maximum capacity')
    end

    it 'raises error is weather is stormy' do
      allow(subject).to receive(:weather) { 'stormy' }
      expect { subject.land(Plane.new) }.to raise_error('Weather conditions unacceptable for landing')
    end
  end

  context '#take_off' do
    it 'can be called on an Airport' do
      expect(subject).to respond_to(:take_off)
    end

    it 'removes a Plane from the Airport array' do
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land(Plane.new)
      expect { subject.take_off }.to change { subject.planes.length }.by(-1)
    end

    it 'raises an error if there are no planes in the Airport' do
      expect { subject.take_off }.to raise_error('Airport empty')
    end

    it 'changes Plane landed attribute to false' do
     allow(subject).to receive(:weather) { 'sunny' }
     plane = Plane.new
     subject.land(plane)
     expect { subject.take_off }.to change { plane.landed }.from(true).to(false)
    end

    it 'confirms Plane is no longer in the Airport' do
      allow(subject).to receive(:weather) { 'sunny' }
      plane = Plane.new
      subject.land(plane)
      expect { subject.take_off }.to output("#{plane} has taken off").to_stdout
    end

    it 'raises error if weather is stormy' do
      subject.land(Plane.new)
      allow(subject).to receive(:weather) { 'stormy' }
      expect { subject.take_off }.to raise_error('Weather conditions unacceptable for take off')
    end
  end

  context '#weather' do
    it 'returns a string' do
      expect(subject.weather).to be_instance_of(String)
    end

    it 'returns sunny or stormy at random' do
      outputs = []

      until outputs.include?('sunny') && outputs.include?('stormy') do
        outputs.push(subject.weather)
      end

      outputs.each do |output| 
        expect(output).to eq('sunny').or eq('stormy')
      end
    end
  end
end