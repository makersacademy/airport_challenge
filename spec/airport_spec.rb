require_relative '../lib/airport'

describe Airport do
  describe 'capacity?' do
    it "responds to capacity" do
      plane = Plane.new
      airport = Airport.new(plane)
      expect(airport.capacity?).to be_nil
    end  
  end

  describe '#release_plane' do
    it "responds to release_plane with a plane" do
      plane = Plane.new
      airport = Airport.new(plane)
      expect(airport.release_plane).to be_instance_of Plane
    end  
  end
  
  describe '#dock_plane' do
    it "responds to dock_plane with 1 argument" do
      plane = Plane.new
      airport = Airport.new(plane)
      expect(airport).to respond_to(:dock_plane).with(1).argument
    end

    it "responds to dock_plane with plane" do
      plane = Plane.new
      airport = Airport.new(plane)
      expect(airport.dock_plane(plane)).to eq plane
    end
  end

  # attribute testing here
  describe 'Predicate matchers' do
    it 'this is to test plane attribute' do
      plane = Plane.new
      airport = Airport.new(plane)
      expect(airport.plane).to eq plane
    end
  end

end
