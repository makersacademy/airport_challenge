require 'plane'

describe Plane do

  let(:aiport) { double(:airport) }
 

  it "plane responds to #land" do
    expect(subject).to respond_to(:land)
  end

  it "can land at an airport" do
    aiport.stub(:park).with(an_instance_of(Plane)) { true }
    expect(aiport.park(subject)).to eq true
  end

end
