require 'airport'

describe Airport do

  it { should respond_to :land }

  it 'is expected to take a plane as a parameter when :land is called, and return the same instance' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end

  it { should respond_to :take_off }

  it 'is expected to take a plane as a parameter when :take_off is called, and return the same instance' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.take_off(plane)).to eq plane
  end

  it { should respond_to :plane_at_airport? }

  it 'is expected to take a plane as a parameter when :plane_at_aiport? is called, and return the same instance' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:plane_at_airport) { plane }
  end

  it 'is expected to return false if a plane has taken off from the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.plane_at_airport?(plane)).to eq false
  end

  it 'is expected to return true if a plane is still at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.plane_at_airport?(plane)).to eq true
  end
end
