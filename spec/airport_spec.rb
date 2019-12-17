require 'airport'

describe Airport do

  describe '#land' do
    it 'should instruct a plane to land' do
      expect(Airport.new).to respond_to(:land_plane).with(1).argument
    end

    it 'should raise an error when airport is full' do
      subject.capacity.times { subject.land_plane Airplane.new }
      expect { subject.land_plane Airplane.new }.to raise_error("Airport is full")
    end
  end

  describe '#take off' do

    it 'should instruct a plane to take off' do
      expect(Airport.new).to respond_to(:take_off).with(1).argument
    end

    it 'should show whether plane has left the airport' do
      plane = Airplane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'should show if airport is empty' do      
        expect { subject.take_off }.to raise_error("Airport is empty")

    end
  end

end
