require 'airport'

describe Airport do
  describe 'initialize' do
    indiport = Airport.new

    it 'creates a new airport called indiport' do
      expect(indiport).to be_an_instance_of(Airport)
    end

    it 'creates an empty array for the planes to land in' do
      expect(indiport.planes).to be_empty
    end

  end

  describe '#land_plane' do
    it 'raises an error if the airport is full' do
      p1 = Plane.new
      subject.land_plane(p1)
      p2 = Plane.new
      subject.land_plane(p2)
      p3 = Plane.new
      expect { subject.land_plane(p3) }.to raise_error(AirportFullError, 'this airport is full')
    end

    it 'raises an error if the plane is not flying' do
      plane = Plane.new
      subject.land_plane(plane)
      expect { subject.land_plane(plane) }.to raise_error(WrongStateError, 'this plane is not flying')
    end

    it 'adds the plane to planes array' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.planes).to include(plane)
    end

    it 'changes the state of the plane to landed' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(plane.state).to eq :landed
    end
  end

  describe '#take_off' do
    it 'raises an error if the plane is already flying' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error(WrongStateError, 'this plane is already flying')
    end

    it 'raises an error if the plane is not in this airport' do
      plane1, plane2 = Plane.new, Plane.new
      ap1, ap2 = Airport.new, Airport.new

      ap1.land_plane(plane1)
      ap2.land_plane(plane2)
      expect { ap1.take_off(plane2) }.to raise_error(WrongAirportError, 'that plane is not at this airport')
    end

    it 'removes plane from airport' do
      plane = Plane.new
      plane1 = Plane.new
      subject.land_plane(plane)
      subject.land_plane(plane1)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'changes the state to flying' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(plane.state).to eq :flying
    end

  end
end
