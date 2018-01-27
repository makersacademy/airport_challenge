require 'airport'

describe Airport do
  # it { should respond_to(:land).with(1).argument }
  # it { should respond_to(:planes)}

  it "has an empty planes array when created" do
    expect(subject.planes).to eq []
  end

  # expect land(plane) to add plane to the array
  it "stores the plane in the airport when landing" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include plane
  end
end
