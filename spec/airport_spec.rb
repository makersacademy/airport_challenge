require 'airport'

describe Airport do
  it "should be able to create an instance of Airport" do
    expect(Airport).to respond_to(:new)
  end

  it { is_expected.to respond_to(:land_plane) }
  
  it "accept one argument when land_plane" do
    expect(subject).to respond_to(:land_plane).with(1).argument 
  end

  it { is_expected.to respond_to(:take_off) }

  it "should confirm that plane not longer at airport" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    before_planes = airport.airplanes.length
    airport.take_off
    expect(airport.airplanes.length).to eq(before_planes - 1)
  end

  it "should raise an error when capacity is full" do
    Airport::MAXIMUM_CAPACITY.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane(Plane.new) }.to raise_error("Airport full")
  end
end
