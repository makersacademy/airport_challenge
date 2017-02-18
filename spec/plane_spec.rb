#require 'coveralls'
#Coveralls.wear!
require 'plane'

describe Plane do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new(@airport)
  end

  it "lands when instructed to land" do
    expect(@plane).to respond_to(:land).with(1).argument
  end

  it "changes status after landing" do
    expect(@plane).to respond_to(:status)
  end

  it "status changes to landed after landing" do
    @plane.land(@airport)
    expect(@plane.status).to eq "Landed"
  end

  it "raises an error if invalid airport name passed, status remains unchanged" do
    expect {@plane.land(123)}.to raise_error("Invalid airport")
    expect(@plane.status).to eq "Landed"
  end

  it "takes off when instructed to take off" do
    expect(@plane).to respond_to(:take_off).with(1).argument
  end

  it "changes status after take off" do
    @plane.take_off(@airport)
    expect(@plane.status).to eq "In-Flight"
  end

  it "only accepts strings as arguments" do
    expect {@plane.take_off(123)}.to raise_error("Invalid airport")
    expect(@plane.status).to eq "Landed"
  end
end
