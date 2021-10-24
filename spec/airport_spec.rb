require 'airport'

describe Airport do
  it "instructs a plane to land" do
    expect(subject).to respond_to :land
  end

  it "instructs a plane to take_off" do
    expect(subject).to respond_to :take_off
  end

  it "creates an object that lands" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "stores a plane at the airport when one is landed" do
    plane = Plane.new
    expect(subject.land(plane)).to include plane
  end

  it "removes plane from airport" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "Plane has departed from the airport"
  end
end