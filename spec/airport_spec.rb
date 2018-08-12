require './lib/airport'

describe Airport do
  
  it "verifies Airport exists" do
    expect(subject).to be_a(Object)
  end

  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "makes a plane take off" do
    plane = Plane.new
    expect(plane).not_to eql(subject.take_off(plane))
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 
end







