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
end
