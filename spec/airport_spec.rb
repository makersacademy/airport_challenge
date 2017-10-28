require 'airport'

describe Airport do
  subject { Airport.new }

  it "should create a new airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "should respond to #land" do
    expect(subject).to respond_to(:land)
  end

  it "should respond to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "should respond to #planes" do
    expect(subject).to respond_to(:planes)
  end

  it "#planes should return an array" do
    expect(subject.planes).to be_an_instance_of(Array)
  end
end
