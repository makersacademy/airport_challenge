require 'airport'

describe Airport do

  describe '#instruct_land' do
    it 'instructs a plane to land at an airport' do
        plane = Plane.new
        expect(subject.instruct_land(plane)).to eq subject.planes
    end

    it '#instructs a plane to land when there is already one there' do
      plane = Plane.new
      subject.instruct_land(plane)
      plane2 = Plane.new
      expect(subject.instruct_land(plane2)).to eq subject.planes
    end

    it 'raises an error if a grounded plane tries to land' do
        plane = Plane.new
        subject.instruct_land(plane)
        expect { subject.instruct_land(plane) }.to raise_error("Error: this plane has already landed")
    end

  end

  describe '#instruct_take_off' do
    it 'instructs a plane to take off from an airport' do
      plane = Plane.new
      subject.instruct_land(plane)
      expect(subject.instruct_take_off).to eq subject.planes
    end

    it 'raises an error when there are no planes in the airport' do
      expect {subject.instruct_take_off }.to raise_error("Error: no planes in airport")
    end
  end

  describe '#max_capacity' do
    it 'raises an error when a plane tries to land in a full airport' do
      subject.max_capacity.times { subject.instruct_land Plane.new }
      expect { subject.instruct_land Plane.new }.to raise_error("Error: Airport is full. find somewhere else to land")
    end
  end
    
    it 'allows a maximum capacity to be specified' do
        expect(Airport.new(5).max_capacity).to eq 5
    end

end