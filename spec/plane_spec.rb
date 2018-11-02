require 'plane'

describe Plane do

  let(:aiport) { double(:airport) }
  let(:plane) { Plane.new }

  it "plane responds to #land" do
    expect(subject).to respond_to(:land)
  end

  it "can land at an airport" do
    aiport.stub(:park).with(an_instance_of(Plane)) { true }
    expect(aiport.park(subject)).to eq true
  end

  it "plane responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end
  
  it "can #take_off from an airport" do
    aiport.stub(:planes) { plane }
  end

end
