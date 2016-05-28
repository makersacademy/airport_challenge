require 'airport'

describe Airport do

  it "returns a message if a plane has landed" do
    plane = Plane.new
    expect(subject.land(plane)).to eq "You have landed plane: #{plane}"
  end

  it "responds to take off" do
    expect(subject).to respond_to :take_off
  end

  it "returns a message when the plane has taken off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq "The flight now leaving is: #{plane}"
  end




end
