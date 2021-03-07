require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to(:land)
  end

  it 'allows a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'allows plane to take_off and removes it from airport' do
    plane = Plane.new(false)
    expect(subject.take_off(plane)).to eq(plane)
  end

  it 'throws an error when airport is full' do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("Airport full")
  end

  it 'is initialized with a capacity inout capacity' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq(30)
  end

  it 'is initialized with a default capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "can't land a plane if the airplane is not in the air" do
    airport = Airport.new
    plane = Plane.new(false)
    expect { airport.land(plane) }.to raise_error("Plane is at another airport")
  end

  it "can't let a plane take-off if it already in the air" do
    airport = Airport.new
    plane = Plane.new(true)
    expect { airport.take_off(plane) }.to raise_error("Plane is already in the air")
  end

end
