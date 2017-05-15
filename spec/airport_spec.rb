require 'airport'

describe Airport do

  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  subject(:airport) { described_class.new }

  describe '#land_plane' do
    it "confirms landed planes" do
      allow(plane).to receive(:land).and_return :landed
      allow(weather).to receive(:stormy?).and_return false
      expect(airport.land_plane(plane, weather)).to eq [plane]
    end

    it "returns an error if a plane tries to land when the airport is at capacity" do
      allow(plane).to receive(:land).and_return :landed
      allow(weather).to receive(:stormy?).and_return false
      20.times { airport.land_plane(Plane.new, weather) }
      expect { airport.land_plane(plane, weather) }.to raise_error "Permission denied"
    end

    it "returns an error if a plane tries to land when the weather is stormy" do
      allow(plane).to receive(:land).and_return :landed
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.land_plane(plane, weather) }.to raise_error "Permission denied"
    end
  end

  describe '#clear_plane' do
    it "clears a plane to take off" do
      airport.landed_planes << plane
      allow(plane).to receive(:take_off).and_return :airborn
      allow(weather).to receive(:stormy?).and_return false
      expect(airport.clear_plane(plane, weather)).to eq []
    end

    it "prevents planes taking off in bad weather" do
      airport.landed_planes << plane
      allow(plane).to receive(:take_off).and_return :airborn
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.clear_plane(plane, weather) }.to raise_error "Permission denied"
    end
  end

  describe '#override_capacity' do
    it "allows the sys_admin to set a new default capacity" do
      expect(airport.override_airport_capacity(21)).to eq 21
    end
  end

  describe '#edge_cases' do
    it "ensures planes that are already flying cannot take off" do
      allow(airport).to receive(:stormy?).and_return false
      expect { airport.clear_plane(plane, weather) }.to raise_error "Permission denied"
    end

    it "ensures that planes in an airport are not airborn" do
      expect(airport.landed_planes).not_to include plane
    end

    it "ensures planes that are landed cannot land again" do
      allow(weather).to receive(:stormy?).and_return false
      allow(plane).to receive(:land).and_return :airborn
      expect { 2.times { airport.land_plane(plane, weather) } }.to raise_error "Permission denied"
    end

    it "ensures planes can only take off from airports they are in" do
      new_airport = Airport.new
      airport.landed_planes << plane
      allow(weather).to receive(:stormy?).and_return false
      allow(plane).to receive(:landing_status).and_return :landed
      expect { new_airport.clear_plane(plane, weather) }.to raise_error "Permission denied"
    end
  end
end
