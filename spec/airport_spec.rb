require_relative "../lib/airport"

describe Airport do

  it { is_expected.to respond_to(:has?).with(1).argument }
  it { is_expected.to respond_to(:full?) }

  it '#full? returns true if number of landed planes equals airport capacity' do
    airport = Airport.new
    airport.capacity.times { airport.landed_planes << Plane.new }
    expect(airport.full?).to be true
  end

  it 'before take off of a landed plane, the plane should be in the collection of landed_planes' do
    airport = Airport.new
    plane = Plane.new

    airport.capacity.times { airport.landed_planes.push(Plane.new) }

    expect(airport.landed_planes).not_to include(plane)

    airport.landed_planes.pop
    airport.landed_planes << plane

    expect(airport.landed_planes).to include(plane)
  end

  it "has? should be able to confirm if a plane is at this airport" do
    plane_1 = Plane.new
    airport = Airport.new
    plane_2 = Plane.new(airport)
    
    expect(airport.has?(plane_1)).to be false
    expect(airport.has?(plane_2)).to be true
  end

  it "default capacity can be overridden" do    
    expect(Airport.new(12).capacity).to eq 12
    expect(Airport.new(21).capacity).to eq 21

    airport = Airport.new

    airport.capacity = 15
    expect(airport.capacity).to eq 15
  end
end
