require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  describe '#responsiveness' do
    it { is_expected.to respond_to(:land_plane).with(1).argument }
    it { is_expected.to respond_to :landed_planes }
    it { is_expected.to respond_to(:clear_plane).with(1).argument }
    it { is_expected.to respond_to :capacity }
    it { is_expected.to respond_to(:override_capacity).with(1).argument }
  end

  describe '#land_plane' do
    it "confirms landed planes" do
      allow(subject).to receive(:stormy?).and_return false
      allow(plane).to receive(:land).and_return "landed"
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it "returns an error if a plane tries to land when the airport is at capacity" do
      allow(subject).to receive(:stormy?).and_return false
      allow(plane).to receive(:land).and_return "landed"
      20.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane(plane) }.to raise_error "Maintain holding pattern -> Airport at Capacity"
    end

    it "returns an error if a plane tries to land when the weather is stormy" do
      subject.instance_variable_set("@weather", 0) # ensures it is always stormy!
      allow(plane).to receive(:land).and_return "landed"
      expect { subject.land_plane(plane) }.to raise_error "Maintain holding pattern -> Stormy Weather"
    end
  end

  describe '#clear_plane' do
    it "clears a plane to take off" do
      allow(subject).to receive(:stormy?).and_return false
      subject.landed_planes << plane
      allow(plane).to receive(:landing_status).and_return "landed"
      allow(plane).to receive(:take_off).and_return "airborn"
      expect(subject.clear_plane(plane)).to eq []
    end

    it "prevents planes taking off in bad weather" do
      subject.instance_variable_set("@weather", 0) # ensures it is always stormy!
      allow(plane).to receive(:take_off).and_return "airborn"
      expect { subject.clear_plane(plane) }.to raise_error "Cannot clear plane -> Stormy Weather"
    end
  end

  describe '#override_capacity' do
    it "allows the sys_admin to set a new default capacity" do
      expect(subject.override_capacity(21)).to eq 21
    end
  end

  describe '#edge_cases' do
    it "ensures planes that are already flying cannot take off" do
      allow(subject).to receive(:stormy?).and_return false
      allow(plane).to receive(:landing_status).and_return "airborn"
      expect { subject.clear_plane(plane) }.to raise_error "Cannot clear plane -> Plane not in airport"
    end

    it "ensures that planes in an airport are not airborn" do
      expect(subject.landed_planes).not_to include plane
    end

    it "ensures planes that are landed cannot land again" do
      allow(subject).to receive(:stormy?).and_return false
      allow(plane).to receive(:landing_status).and_return "landed"
      2.times { subject.landed_planes << plane }
      expect { subject.land_plane(plane) }.to raise_error "Plane already in airport"
    end

    it "ensures planes can only take off from airports they are in" do
      new_airport = Airport.new
      subject.landed_planes << plane
      allow(new_airport).to receive(:stormy?).and_return false
      allow(subject).to receive(:stormy?).and_return false
      allow(plane).to receive(:landing_status).and_return "landed"
      allow(plane).to receive(:take_off).and_return "airborn"
      expect(subject.clear_plane(plane)).to eq []
      expect { new_airport.clear_plane(plane) }.to raise_error "Cannot clear plane -> Plane not in airport"
    end
  end
end
