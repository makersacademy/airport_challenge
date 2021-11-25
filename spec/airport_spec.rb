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
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    before_planes = airport.airplanes.length
    airport.take_off
    expect(airport.airplanes.length).to eq(before_planes - 1)
  end

  it "should raise an error when capacity is full" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    Airport::MAXIMUM_CAPACITY.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane(Plane.new) }.to raise_error("Airport full")
  end
  
  it "should have a default capacity of 20 when no armgument is given" do
    expect(subject.capacity).to eq Airport::MAXIMUM_CAPACITY
  end

  it "should raise an error when take off and is stormy" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(Plane.new)
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    expect { airport.take_off }.to raise_error("Can not take off: weather stormy")
  end

  it "should raise an error when land and is stormy" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    expect { subject.land_plane(Plane.new) }.to raise_error("Can not land: weather stormy")
  end
  
  it 'planes can only take off from airports they are in' do
    airport = Airport.new
    airport2 = Airport.new
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    airport.land_plane(plane)
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    expect(airport2.take_off).to eq nil
  end

  it "planes that are already flying cannot take off and/or be in an airport" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    first_state = airport.airplanes.count
    airport.take_off
    second_state = airport.airplanes.count
    expect(first_state == second_state).to eq false
  end

  it 'planes that are landed cannot land again and must be in an airport' do
  end
end
