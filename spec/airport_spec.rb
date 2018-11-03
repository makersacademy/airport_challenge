require "airport"

describe Airport do
  @plane = Plane.new
  it "expects #new to create an instance of Airport" do
    expect(Airport.new).to be_a Airport
  end
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "expects to add plane to hangar" do
      subject.land(@plane)
      expect(subject.hangar).to include(@plane)
    end
    it "expects to raise an error if weather is stormy" do
      subject.weather = "stormy"
      expect { subject.land(@plane) }.to raise_error "The weather is stormy, planes cannot land."
    end
    it "expects to raise an error if Plane is already in hangar" do
      subject.land(@plane)
      expect { subject.land(@plane) }.to raise_error "That plane has already landed."
    end
    it "expects to raise an error if hangar is full" do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(@plane) }.to raise_error "The hanger is full, planes cannot land."
    end
  end
  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it "expects to remove plane from hangar" do
      subject.land(@plane)
      subject.takeoff(@plane)
      expect(subject.hangar).not_to include(@plane)
    end
    it "expects to raise an error if weather is stormy" do
      subject.weather = "stormy"
      expect { subject.takeoff(@plane) }.to raise_error "The weather is stormy, planes cannot take off."
    end
    it "expects to raise an error if Plane is not in hangar" do
      expect { subject.takeoff(@plane) }.to raise_error "That plane is not in this airport's hangar."
    end
  end
  describe "#capacity" do
    it "expects to raise an error if used directly" do
      expect { subject.capacity = 1 }.to raise_error(NoMethodError)
    end
  end
  describe "#change_capacity" do
    it { is_expected.to respond_to(:change_capacity).with(1).argument }
    it "expects to raise an error if hangar holding more planes than argument" do
      subject.change_capacity(3)
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.change_capacity(2) }.to raise_error "More than #{2} already in hangar"
    end
  end
end