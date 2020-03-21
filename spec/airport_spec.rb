require 'airport'

describe Airport do
  it "Airport responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "when #take_off is called on Airport, it creates a new plane" do
    expect(subject.take_off).to be_instance_of(Plane)
  end
end
