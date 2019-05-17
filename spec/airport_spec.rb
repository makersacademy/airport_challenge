require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new  }
  let(:weather) { Weather.new }

  it 'can instruct a plane to land' do
    expect(airport).to respond_to('land_plane')
  end

  it 'stores a plane in a hangar when it lands' do
    allow(airport).to receive(:rand).and_return(1)
    airport.land_plane(plane)
    expect(airport.hangar).to include(plane)
  end

  it 'can instruct a plane to take off' do
    allow(airport).to receive(:rand).and_return(1)
    expect(airport).to respond_to('takeoff')
  end

  it 'can takeoff a plane' do
    allow(airport).to receive(:rand).and_return(1)
    airport.land_plane(plane)
    expect(airport.takeoff).to be_a_kind_of(Plane)
  end

  it 'will release a plane from the hangar, not generate a new plane' do
    allow(airport).to receive(:rand).and_return(1)
    airport.land_plane(plane)
    expect(airport.takeoff).to eq(plane)
  end

  it 'will remove the plane from the hangar when it takes off and not make a copy' do
    allow(airport).to receive(:rand).and_return(1)
    airport.land_plane(plane)
    airport.takeoff
    expect(airport.hangar.length).to eq(0)
  end

  it 'will reject a plane if airport is full' do
    allow(airport).to receive(:rand).and_return(1)
    Airport::DEFDAULT_HANGAR_SIZE.times { airport.land_plane(Plane.new)}
    expect { airport.land_plane(plane) }.to raise_error("Airport is full")
  end

  it 'allows custom airport sizes' do
    airport = Airport.new 40
    allow(airport).to receive(:rand).and_return(1)
    40.times { airport.land_plane(Plane.new) }
    expect { airport.land_plane(Plane.new) }.to raise_error("Airport is full")
  end

  it 'can tell you the weather' do
    expect(airport).to respond_to('stormy?')
  end

  it 'can tell you if its sunny' do
    allow(airport).to receive(:rand).and_return(20)
    expect(airport.stormy?).to eq(false)
  end

  it 'will sometimes return stormy' do
    allow(airport).to receive(:rand).and_return(50)
    expect(airport.stormy?).to eq(true)
  end

  it 'prevents planes landing if its stormy' do
    allow(airport).to receive(:rand).and_return(50)
    expect{ airport.land_plane(plane) }.to raise_error("Stormy, cannot land")
  end

  it 'prevents palnes taking off if its stormy' do
    airport.land_plane(plane)
    allow(airport).to receive(:rand).and_return(50)
    expect{ airport.takeoff }.to raise_error("Stormy, cannot takeoff")
  end

  it 'prevents a landed plane from landing again' do
    allow(airport).to receive(:rand).and_return(1)
    plane.flying = false
    expect{ airport.land_plane(plane) }.to raise_error("Plane has already landed")
  end

  it 'prevents a flying plane from taking off' do
    allow(airport).to receive(:rand).and_return(1)
    airport.land_plane(plane)
    plane.flying = true
    expect{ airport.takeoff }.to raise_error("Plane is already flying")
  end



end
