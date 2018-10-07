require 'airport'
require 'weather'
require 'plane'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument }

  it "lands plane in hanger" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hanger).to eq [plane]
  end

  it "does not allow take-off if stormy" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq "The plane has taken off"
    weather = Weather.new
    weather.condition == "stormy"
    expect {subject.take_off}.to raise_error "Weather is stormy, do not take off!"
  end

  it "does not allow landing if stormy" do
    plane = Plane.new
    weather = Weather.new
    weather.condition == 'stormy'
    expect {subject.land(plane)}.to raise_error "Weather is stormy, do not land!"
  end

  it "does not allow more planes to land if hanger is at full capacity" do
    subject.capacity.times {subject.land(Plane.new)}
    expect {subject.land(Plane.new)}.to raise_error "Hanger is full"
  end

  it "has a default capacity, if no params to Airport" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
