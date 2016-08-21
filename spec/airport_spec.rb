require 'airport.rb'

describe Airport do

  it "instructs plane to land" do
    plane = Plane.new
    subject.land(plane)
    expect(plane).to be_landed
  end

  it "instructs a plane to take off" do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.instance_variable_get(:@landed)).to eq false

  end

  it "no take off in storms" do
    subject.instance_variable_set(:@weather, "stormy")
    plane = Plane.new
    expect { subject.take_off(plane)}.to raise_error "Too stormy"
  end

end
