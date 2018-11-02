require "airport"

describe Airport do
  it "expects #takeoff to take an argument" do
    expect(subject.takeoff(Plane.new)).to eq "The plane has taken off."
  end
  it "expects #takeoff to remove plane from hangar" do
    of815 = Plane.new
    subject.land(of815)
    subject.takeoff(of815)
    expect(subject.hangar).not_to include(of815)
  end
  it "expects #takeoff to raise an error if weather is stormy" do
    stansted = Airport.new
    stansted.weather = "stormy"
    expect { stansted.takeoff(Plane.new) }.to raise_error "The weather is stormy, planes cannot take off."
  end
  it "expects #land to take an argument" do
    of815 = Plane.new
    subject.land(of815)
    expect(subject.hangar).to include(of815)
  end
  it "expects #land to raise an error if hangar is full" do
    subject.capacity.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error "The hanger is full, planes cannot land."
  end
  it "expects #land to raise an error if weather is stormy" do
    stansted = Airport.new
    stansted.weather = "stormy"
    expect { stansted.land(Plane.new) }.to raise_error "The weather is stormy, planes cannot land."
  end
  it "expects #land to raise an error if trying to land a plane that has already landed" do
    of815 = Plane.new
    subject.land(of815)
    expect { subject.land(of815) }.to raise_error "That plane has already landed."
  end
end