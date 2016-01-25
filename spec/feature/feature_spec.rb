require 'plane.rb'

describe 'Feature Test - @planes works correctly' do
  it 'stores planes when they land'do
    ba100 = Plane.new
    ba200 = Plane.new
    heathrow = Airport.new
    ba100.land(heathrow, :sunny)
    ba200.land(heathrow, :sunny)
    expect(heathrow.planes.include?(ba100)).to eq true
  end
  it 'removes planes when they take off'do
    heathrow = Airport.new
    ba100 = Plane.new
    ba200 = Plane.new
    ba300 = Plane.new
    ba100.land(heathrow, :sunny)
    ba200.land(heathrow, :sunny)
    ba300.land(heathrow, :sunny)
    ba200.takeoff(heathrow,:sunny)
    ba300.takeoff(heathrow, :sunny)
    expect(heathrow.planes.include?(ba200)).to eq false
  end
end
