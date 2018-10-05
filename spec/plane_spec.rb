require "plane.rb"

describe Plane do

  before(:each) do
    @plane = Plane.new
  end

  it "can land" do
    expect(@plane).to respond_to :land
  end

  it "confirms status as landed" do
    @plane.land(@plane)
    expect(@plane.status).to eq "parked"
  end

  it "can takeoff" do
    expect(@plane).to respond_to :takeoff
  end

  it "confirms status as takeoff" do
    @plane.takeoff(@plane)
    expect(@plane.status).to eq "flying"
  end
end
