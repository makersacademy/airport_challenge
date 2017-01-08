require 'plane'

describe Plane do
  plane = Plane.new
  weather = Weather.new
  it "respond to the land method" do
    expect(subject).to respond_to(:land)
  end
  it "can land" do
    plane.land
    expect(plane.landed).to eq true
  end
  it "can confirm when it has landed" do
    allow(plane).to receive(:land).and_return("Plane has succesfully has landed")
  end
  it "respond to the take_off method" do
    expect(subject).to respond_to(:take_off)
  end
  it "can take_off" do
    plane.take_off
    expect(plane.landed).to eq false
  end
  it "can confirm when it has taken off" do
    expect(plane.take_off).to eq("Plane has succesfully has taken off")
  end

  end
