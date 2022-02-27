require './lib/airport'

describe Airport do

  it "check airport object" do
    expect{Airport.new}.to_not raise_error
  end

  it "check plane object" do
    expect{Plane.new}.to_not raise_error
  end

  it "check land a plane in the airport" do
    airport = Airport.new
    expect{airport.land}.to_not raise_error
  end

  it "check a plane taking off from the airport" do
    airport = Airport.new
    expect{airport.take_off}.to_not raise_error
  end


end