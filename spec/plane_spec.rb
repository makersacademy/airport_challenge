require 'airport'
require 'plane'
require 'weather'

describe Plane do
  plane = Plane.new
  airportz = Airport.new(:LHR, 50)

  it "has default value of airport = nil" do
    expect(plane.airport).to eq nil
  end

  it "has default value of status = grounded" do
    expect(plane.location). to eq "grounded"
  end

  it "will only allow call to land to respond to 'takeoff' or 'landing' with airport_id" do
    expect { plane.clear_for_action("blah") }.to raise_exception "Not a valid clearance command"
  end

  plane1 = Plane.new
  plane1.location = "flying"

  it "if weather ok plane registers call to land" do
    airportz.call_to_land(plane1, "good")
    expect(plane1.action_status).to eq :LHR
  end

  it "if weather ok plane registers call to take off" do
    airportz.call_to_land(plane1, "good")
    plane1.land
    airportz.call_takeoff(plane1, "good")
    expect(plane1.action_status).to eq "takeoff"
  end

  it "registered as grounded at airport once landed and action_status is reset" do
    plane.clear_for_action("land", :LHR)
    plane.land
    a_s = plane.action_status
    expect(plane.airport == :LHR && plane.location == "grounded" && a_s.nil?).to eq true
  end

  it "after take off sets airport to nil, location to 'flying' and action_status resets" do
    plane.clear_for_action("takeoff")
    plane.take_off
    a_s = plane.action_status
    expect(plane.airport.nil? && plane.location == "flying" && a_s.nil?).to eq true
  end

end
