#require 'coveralls'
#Coveralls.wear!
require 'plane'

describe Plane do
  before(:each) do
    @plane = Plane.new
  end

  it "lands when instructed to land" do
    expect(@plane).to respond_to(:land).with(1).argument
  end

  it "confirms that it has landed" do
    expect(@plane).to respond_to(:status)
  end

  it "status changes to landed after landing" do
    @plane.land("LHR")
    expect(@plane.status).to eq "Landed at LHR"
  end

  it "raises an error if invalid airport name passed, status remains unchanged" do
    expect {@plane.land(123)}.to raise_error("Invalid airport")
    expect(@plane.status).to eq nil
  end
end
