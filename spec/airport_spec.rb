require_relative '../lib/airport'

describe Airport do
  describe '#capacity?' do
    it { is_expected.to respond_to(:capacity?) }
  end
  describe '#release_plane' do
    it { is_expected.to respond_to(:release_plane) }
  
    it "responds to release_plane with a plane" do
      airport = Airport.new
      expect(airport.release_plane).to be_instance_of Plane
    end  
  end
  describe '#dock_plane' do
    it { is_expected.to respond_to(:dock_plane) }
  
    it "responds to dock_plane with one argument" do
      airport = Airport.new
      expect(airport).to respond_to(:dock_plane).with(1).argument
    end  
  end
end