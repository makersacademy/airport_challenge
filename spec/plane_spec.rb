require 'plane'

describe Plane do
  plane = Plane.new

  it { expect(plane).to be_a Plane }

  it "should have default in_flight status set to false" do

    expect(plane.flight_status).to eq false
  end

  it "should update flight status on take off" do
    plane = Plane.new  
    plane.take_off

    expect(plane.flight_status).to eq true
  end
  
  it "should update flight status on land" do
    plane = Plane.new
    plane.take_off
    plane.land

    expect(plane.flight_status).to eq false
  end
  

end
