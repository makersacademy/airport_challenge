require "fleet"
require "plane"

describe "Fleet" do

  it "can create an instant of fleet" do
    fleet = Fleet.new
    expect(fleet).to be_kind_of(Fleet)
  end

  it "can responde to planes" do
    fleet = Fleet.new
    expect(fleet).to respond_to(:planes)
  end 

  it "should show 5 planes initially" do
    fleet = Fleet.new
    expect(fleet.planes).to eq(5)
  end

  it "add plane to the fleet when it lands" do
    fleet = Fleet.new
    expect(fleet).to respond_to(:land)
  end 

  it "reduce by one the fleet when a plane take off" do
    fleet = Fleet.new
    expect(fleet).to respond_to(:takeoff)
  end 

  it "should update the number of planes in the fleet after land" do
    fleet = Fleet.new
    fleet.land (3)
    expect(fleet.planes).to eq(8)
  end 

  it "should update the number of planes in the fleet after takeoff" do
    fleet = Fleet.new
    fleet.takeoff (3)
    expect(fleet.planes).to eq(2)
  end 

end
