require "plane.rb"

describe Plane do
  subject(:plane) { Plane.new }
  #plane = Plane.new
  let(:airport) { double :airport }
  #airport = class_double("Airport")

  before(:each) do
    allow(airport).to receive(:land).and_return(true)
    allow(airport).to receive(:takeoff).and_return(true)
    allow(airport).to receive(:safe?).and_return(true)
    allow(airport).to receive(:space?).and_return(true)
    allow(airport).to receive(:takeoff).and_return(true)
  end

  it "lands at an airport" do
    plane.land(airport)
    expect(plane.location).to eq airport
  end

  it "takes off"  do
    plane.instance_variable_set(:@location, airport)
    plane.takeoff()
    expect(plane.location).to eq :in_flight
  end

  it "doesn't land when airport is full" do
    allow(airport).to receive(:space?).and_return(false)
    plane.land(airport).to raise_error("Airport is full")
  end

  # before do
  #   allow(airport).to receive(:safe?).and_return(false)
  # end

  it "doesn't land when the weather is unsafe" do
    allow(airport).to receive(:safe?).and_return(false)
    expect(plane.land(airport)).to raise_error("Not safe to takeoff")
  end

  it "doesn't takeoff when the weather is unsafe" do
    allow(airport).to receive(:safe?).and_return(false)
    expect(plane.takeoff).to raise_error("Not safe to takeoff")
  end

end
  
