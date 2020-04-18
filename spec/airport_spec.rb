require 'airport'

describe Airport do
  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:undock).with(1).argument }
  it { is_expected.to respond_to(:docked?).with(1).argument }
  
  describe "#planes" do
    it "returns an Array" do
      expect(subject.planes).to be_a_kind_of(Array)
    end
  end
  
  describe "#dock" do
    it "adds a plane to its list of planes" do
      plane = Plane.new
      expect { subject.dock(plane) }
      .to change(subject, :planes).to include(plane)
    end
  end
  
  describe "#undock" do
    it "removes a plane from its list of planes" do
      plane = Plane.new
      subject.dock(plane)
      subject.undock(plane)
      expect(subject.planes).to_not include(plane)
    end
  end
end