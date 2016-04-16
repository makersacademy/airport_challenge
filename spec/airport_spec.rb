require 'airport'
require 'plane'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:plane2) { Plane.new }
  it { is_expected.to respond_to :receive_plane }
  it { is_expected.to respond_to :release_plane }
  
  context "Using London TDD" do
    it "instruct a plane to land and confirm that it has landed" do
      allow(plane).to receive(:land).and_return("Landed")
      airport.receive_plane(plane)
      expect(airport.planes).to include plane
      expect(plane.land).to eq "Landed"
    end
    
    it "instruct a plane to take-off and confirm that it is flying" do
      allow(plane).to receive(:take_off).and_return("Flying")
      airport.release_plane(plane)
      expect(airport.planes).not_to include plane
      expect(plane.take_off).to eq "Flying"
    end
    
  end
  
  context "using Chicago TDD" do
    it "instruct a plane to land and confirm that it has landed" do
      airport.receive_plane(plane2)
      expect(airport.planes).to include plane2
      expect(plane2.land).to eq "Landed"
    end
    
    it "instruct a plane to take-off and confirm that it is flying" do
      airport.release_plane(plane2)
      expect(airport.planes).not_to include plane2
      expect(plane2.take_off).to eq "Flying"
    end
    
  end
  
end