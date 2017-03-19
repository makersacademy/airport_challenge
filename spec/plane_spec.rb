require 'plane.rb'

describe Plane do

  it "a plane has landed" do
    plane = Plane.new
    expect(plane).to respond_to :landed?
    expect(plane).to be_landed
  end

  it "instruct a plane to land" do
    plane = Plane.new
    expect(plane).to respond_to :start_landing
    expect(plane.start_landing).to eq true
  end

  it "instruct to take off" do
    plane = Plane.new
    expect(plane).to respond_to :take_off
    expect(plane.take_off).to eq true
    expect(plane.landed?).to_not eq true
    # expect(plane.take_off).not_to eq plane.landed?
  end

  it "doesn't take off if stormy weather" do
    plane = Plane.new
    expect(plane).to respond_to :weather
    allow(plane).to receive(:weather) { 6 }
    expect(plane).to respond_to :take_off
    expect(plane.take_off).to eq false
  end

end
