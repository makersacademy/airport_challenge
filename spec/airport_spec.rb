require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:plane_2) { double(:plane) }

  describe "#land" do
    it "should be able to land a plane" do
      subject.land(plane)
      expect(subject.landed_planes).to eq [plane]
    end

    it "should not land a plane if the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Stormy weather, cannot land."
    end
  end

  it "should be able to display a landed plane" do
    subject.land(plane)
    expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane]}"
  end

  describe "#take_off" do
    it "should be able to instruct a plane to take off" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).to eq []
    end

    it "should raise an error if the specified plane is not in the airport" do
      subject.land(plane)
      expect { subject.take_off(plane_2) }.to raise_error "Plane is not in the airport!"
    end

    it "should not let a plane take off if the weather is stormy" do
      subject.land(plane)
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.take_off(plane) }.to raise_error "Stormy weather, cannot take off."
    end
  end

  it "should be able to confirm that a taken off plane is no longer in the hangar" do
    subject.land(plane)
    subject.land(plane_2)
    subject.take_off(plane)
    expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane_2]}"
  end
end
