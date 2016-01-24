require "plane"

describe Plane do
  
  before(:each) do
    @plane = Plane.new
  end
  
  it "creates a new instance of the class" do
    expect(@plane).to be_a Plane
  end
  
  it { is_expected.to respond_to(:plane_id)}
  
  it "has a unique plane_id" do
    expect(@plane.plane_id).to eq "737-21"
  end
  
  
end