require 'airport'


describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { double(:plane) }

  before do
    allow(plane).to receive(:flying).and_return(true)
    allow(plane).to receive(:flying=)
    allow(airport).to receive(:stormy?).and_return(false)
  end

  it { expect(airport).to respond_to('land_plane') }

  it 'stores a plane in a hangar when it lands' do
    airport.land_plane(plane)
    expect(airport.hangar).to include(plane)
  end

  it { expect(airport).to respond_to('takeoff') }

  it 'can takeoff a plane' do
    airport.land_plane(plane)
    allow(plane).to receive(:flying).and_return(false)
    expect(airport.takeoff).to eq(plane)
  end

  it 'will release a plane from the hangar' do
    airport.land_plane(plane)
    allow(plane).to receive(:flying).and_return(false)
    expect(airport.takeoff).to eq(plane)
  end

  it 'will remove the plane from the hangar when it takes off' do
    airport.land_plane(plane)
    allow(plane).to receive(:flying).and_return(false)
    airport.takeoff
    expect(airport.hangar.length).to eq(0)
  end

  it 'will reject a plane if airport is full' do
    Airport::DEFAULT_HANGAR_SIZE.times { airport.land_plane(plane)}
    expect { airport.land_plane(plane) }.to raise_error("Airport is full")
  end

  it { expect{ airport.takeoff }.to raise_error("No Planes to take off") }

  it 'allows custom airport sizes' do
    airport_40 = Airport.new 40
    allow(airport_40).to receive(:rand).and_return(1)
    40.times { airport_40.land_plane(plane) }
    expect { airport_40.land_plane(plane) }.to raise_error("Airport is full")
  end

  it { expect(airport).to respond_to('stormy?') }

  it 'should often no be stormy' do
    expect(airport.stormy?).to eq(false)
  end


  it 'will sometimes return stormy' do
    airport_storm = Airport.new
    allow(airport_storm).to receive(:rand).and_return(50)
    expect(airport_storm.stormy?).to eq(true)
  end

  it 'prevents planes landing if its stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect{ airport.land_plane(plane) }.to raise_error("Stormy, cannot land")
  end

  it 'prevents palnes taking off if its stormy' do
    airport.land_plane(plane)
    allow(plane).to receive(:flying).and_return(false)
    allow(airport).to receive(:stormy?).and_return(true)
    expect{ airport.takeoff }.to raise_error("Stormy, cannot takeoff")
  end

  it 'prevents a landed plane from landing again' do
    allow(plane).to receive(:flying).and_return(false)
    expect{ airport.land_plane(plane) }.to raise_error("Plane has already landed")
  end

  it 'prevents a flying plane from taking off' do
    airport.land_plane(plane)
    expect{ airport.takeoff }.to raise_error("Plane is already flying")
  end

  it 'changes from flying to not flying when it lands' do
    airport.land_plane(plane)
    allow(plane).to receive(:flying).and_return(false)
    expect(plane.flying).to eq(false)
  end

  it 'changes from not flying to flying when it takes off' do
    airport.land_plane(plane)
    allow(plane).to receive(:flying).and_return(false)
    airport.takeoff
    allow(plane).to receive(:flying).and_return(true)
    expect(plane.flying).to eq(true)
  end



end
