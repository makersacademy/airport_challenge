require 'airport'

describe Airport do
  it "should respond to #land" do
    expect(subject).to respond_to(:land)
  end

  it "should allow a plane to land at the airport" do
    expect(subject.land).to be_a Plane
  end

  it "should respond to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "should respond to #full?" do
    expect(subject).to respond_to(:full?)
  end
end 

describe Plane do
  it "should confirm that the plane is airborn" do
    expect(subject.airborn?).to eq true
  end
end