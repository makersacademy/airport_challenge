require './lib/plane'

describe Plane do
  it "creates an instance of a plane" do
    subject = Plane.new
    expect(subject).to be_instance_of(Plane)
  end
end
