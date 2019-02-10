require './lib/airport.rb'

describe Airport do
  it 'should allow planes to land' do
    airport = Airport.new
    plane_double = double(:plane)

    airport.land_plane(plane_double)

    expect(airport.planes).to eq([plane_double])
  end

  it 'should prevent planes from landing when airport is full' do
    airport = Airport.new
    plane_double = double(:plane)

    10.times { airport.land_plane(plane_double) }

    expect { airport.land_plane(plane_double) }.to raise_error('Plane cannot land as airport is full')
  end
end
