require "airport"

describe Airport do

  it "Tests if a plane can land" do
    expect(subject).to respond_to :land
  end

  it "Tests if plane goes into hanger after landing" do
    p = Plane.new
    expect { subject.land(p) }.to change { subject.hanger.last }.to(p)
  end

  it "Tests if a plane can takeoff" do
    expect(subject).to respond_to :takeoff
  end

  it "Tests if the plane is no longer in the hanger after takeoff" do
    p = Plane.new
    subject.land(p)
    subject.takeoff(p)
    expect(subject.hanger).not_to include(p)
  end

  it "Recieves error if airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error(RuntimeError, "The airport is full.")
  end

  it { is_expected.to respond_to :change_capacity }
end
