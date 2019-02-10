require './lib/airport.rb'

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane_double = double(:plane)
  end

  it 'should allow planes to land' do
    @airport.land_plane(@plane_double)

    expect(@airport.planes).to eq([@plane_double])
  end

  it 'should prevent planes from landing when airport is full' do
    Airport::DEFAULT_CAPACITY.times { @airport.land_plane(@plane_double) }

    expect { @airport.land_plane(@plane_double) }.to raise_error('Plane cannot land as airport is full')
  end

  it 'should optionally set airport capacity when airport created' do
    capacity = 15
    airport = Airport.new(capacity)
    capacity.times { airport.land_plane(@plane_double) }

    expect { airport.land_plane(@plane_double) }.to raise_error('Plane cannot land as airport is full')
  end

  it 'should remove planes when they take off' do
    @airport.land_plane(@plane_double)
    @airport.take_off_plane(@plane_double)

    expect(@airport.planes).to eq([])
  end

  it 'should raise exception if attempts to take off plane that is not in the airport' do
    expect { @airport.take_off_plane(@plane_double) }.to raise_error('Plane is not in this airport')
  end
end
