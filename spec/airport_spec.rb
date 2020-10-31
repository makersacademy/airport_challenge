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
      expect(subject).to respond_to(:land).with(2).arguments
    end

    it 'adds a Plane to the Airport array' do
      expect { subject.land(Plane.new, :sunny) }.to change { subject.planes.length }.by(1)
    end

    it 'changes Plane landed attribute to true' do
      planes_to_land = Array.new(3) { Plane.new }
      
      planes_to_land.each do |plane|
        expect { subject.land(plane, :sunny) }.to change { plane.landed }.from(false).to(true)
      end
    end

    it 'raises an error when the Airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new, :sunny) }
      expect { subject.land(Plane.new, :sunny) }.to raise_error('Cannot land, Airport at maximum capacity')
    end

    it 'raises error is weather is stormy' do
      expect { subject.land(Plane.new, :stormy) }.to raise_error('Weather conditions unacceptable for landing')
    end
  end

  context '#take_off' do
    it 'removes a Plane from the Airport array' do
      subject.land(Plane.new, :sunny)
      expect { subject.take_off(:sunny) }.to change { subject.planes.length }.by(-1)
    end

    it 'raises an error if there are no planes in the Airport' do
      expect { subject.take_off(:sunny) }.to raise_error('Airport empty')
    end

    it 'changes Plane landed attribute to false' do
     plane = Plane.new
     subject.land(plane, :sunny)
     expect { subject.take_off(:sunny) }.to change { plane.landed }.from(true).to(false)
    end

    it 'confirms Plane is no longer in the Airport' do
      plane = Plane.new
      subject.land(plane, :sunny)
      expect { subject.take_off(:sunny) }.to output("#{plane} has taken off").to_stdout
    end

    it 'raises error if weather is stormy' do
      subject.land(Plane.new, :sunny)
      expect { subject.take_off(:stormy) }.to raise_error('Weather conditions unacceptable for take off')
    end
  end
end