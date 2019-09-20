
require 'plane'

RSpec.describe Plane do

  it "allows air traffic only if weather is not stormy" do
    plane = Plane.new
    expect{plane.weather_conditions}.to raise_error 'weather too stormy to takeoff or land'
  end

  it "lands a plane" do
    plane = Plane.new
    expect(plane).to respond_to(:land).with(1).argument
  end

  it "takes off" do
    plane = Plane.new
    expect(plane.take_off).to eq("left airport")
  end


  it "does not land if there is no space" do
    plane = Plane.new
    expect{plane.land(2)}.to raise_error 'airport is too full to land'
  end

end
