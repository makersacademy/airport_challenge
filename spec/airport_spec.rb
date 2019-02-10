require_relative "../lib/airport"

describe Airport do

  it { is_expected.to respond_to(:has?).with(1).argument }
  it { is_expected.to respond_to(:full?) }

  it '#full? returns true if number of landed planes equals airport capacity' do
    airport = Airport.new
    airport.capacity.times { airport.landed_planes << Plane.new }
    expect { airport.full? }
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
end
