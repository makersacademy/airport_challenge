require 'airport'

describe Airport do
  it "instructs plane to land" do
    plane = subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

  it "instructs plane to take off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it "raises error when airport is full" do
    subject.capacity.times{ subject.land Plane.new}
    expect{ subject.land Plane.new }.to raise_error "Airport full"
  end

  it "raises error when no planes" do
    expect{ subject.take_off }.to raise_error "No planes"
  end

  it "sets default airport capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "prevents takeoff when weather is stormy" do

  end

  it "prevents landing when weather is stormy" do

  end

end
