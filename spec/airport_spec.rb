require 'airport'

describe Airport do

  it "allows a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "returns a message if a plane has landed" do
  plane = Plane.new
  expect(subject.land(plane)).to eq "You have landed plane: #{plane}"
  end

end
