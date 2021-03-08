require 'airport'

describe Airport do
  before do
    allow(Weather.new).to receive(:rand) { 4 }
  end
  it 'responds to land' do
    expect(subject).to respond_to(:land)
  end

  it 'allows a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'allows plane to take_off and removes it from airport' do
    plane = Plane.new(false)
    expect(subject.take_off(plane)).to eq(plane)
  end

  it 'throws an error when airport is full' do
    p plane = Plane.new
    Airport::DEFAULT_CAPACITY.times {
      subject.land(plane)
    }
    expect { subject.land(plane) }.to raise_error("Airport full")
  end

  it 'is initialized with a capacity input capacity' do
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

  it "won't let planes fly if the weather is stormy" do
    airport = Airport.new
    plane = Plane.new(false)
    expect{airport.take_off(plane)}.to raise_error "Planes cannot fly when stormy"
  end

  it "won't let planes land if the weather is stormy" do
    airport = Airport.new
    plane = Plane.new(true)
    expect{airport.land(plane)}.to raise_error "Planes cannot land when stormy"
  end
end
