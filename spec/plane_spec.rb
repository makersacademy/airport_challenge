#require 'coveralls'
#Coveralls.wear!
require 'plane'

describe Plane do
  before(:each) do
    @airport = Airport.new("LHR")
    @plane = Plane.new
  end

  it "initial location is 'Factory'" do
    expect(@plane.location).to eq "Factory"
  end

  it "initial state is 'Brand New'" do
    expect(@plane.status).to eq "Brand New"
  end

  it "lands when instructed to land" do
    expect(@plane).to respond_to(:land).with(1).argument
  end

  it "responds to status method" do
    expect(@plane).to respond_to(:status)
  end

  it "status changes to landed after landing" do
    @plane.land(@airport.name)
    expect(@plane.status).to eq "Landed"
  end

  it "raises an error if invalid object type passed to land method, status remains unchanged" do
    expect {@plane.land(123)}.to raise_error("Invalid airport")
    expect(@plane.status).to eq "Brand New"
  end

  it "takes off when instructed to take off" do
    expect(@plane).to respond_to(:take_off)
  end

  it "changes status after take off" do
    @plane.take_off
    expect(@plane.status).to eq "In-Flight"
  end

end
