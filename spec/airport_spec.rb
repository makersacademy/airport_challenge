require "airport"

describe Airport do
  it { is_expected.to respond_to(:confirm_plane_absence).with(1).arguments }
  it { is_expected.to respond_to(:local_weather) }
  it { is_expected.to respond_to(:fleet) }
  it "is expected to respond with false when confirm_plane_absence is called with a plane that is at the airport" do
    plane = instance_double("Plane", :location => subject)
    expect(subject.confirm_plane_absence(plane)).to eq false
  end
  it "is expected to respond with true when confirm_plane_absence is called with a plane that is not at the airport" do
    plane = instance_double("Plane", :location => "not subject")
    expect(subject.confirm_plane_absence(plane)).to eq true
  end
  it "is expected to return a value of either stormy or sunny when local_weather(weather) method is called" do
    expect(subject.local_weather).to eq("stormy").or(eq("sunny"))
  end
  it "is expected to set @fleet equal to an empty array when a plane object is instantiated" do
    expect(subject.fleet).to eq []
  end
  it "is expected to return true when full? method is called on airport that is at max capacity (@fleet.count >= CAPACITY)" do
    subject.capacity.times { subject.add_plane(1) }
    expect(subject.full?).to eq true
  end
  it "is expected to return false when full? method is called on airport that is at under max capacity (@fleet.count < CAPACITY)" do
    (subject.capacity - 1).times { subject.add_plane(1) }
    expect(subject.full?).to eq false
  end
  it "is expected to add plane to @fleet when add_plane method is called with Plane argument" do
    plane = instance_double("Plane", :location => subject)
    subject.add_plane(plane)
    expect(subject.fleet).to eq [plane]
  end
  it "is expected to remove a plane from @fleet when add_plane method is called with Plane argument" do
    plane = instance_double("Plane", :location => subject)
    subject.add_plane(plane)
    subject.remove_plane(plane)
    expect(subject.fleet).to eq []
  end
  it "sets a default @capacity value equal to DEFAULT_CAPACITY constant in Airport class when an airport object is instantiated" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it "can update @capacity using the update_capacity method and passing in a number" do
    subject.update_capacity(15)
    expect(subject.capacity).to eq 15
  end
  it "is expected to raise error if add_plane is called on a full airport" do
    subject.capacity.times { subject.add_plane(1) }
    expect { subject.add_plane(1) }.to raise_error(StandardError, "Sorry, this airport is already full")
  end
end
