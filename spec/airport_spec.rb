require 'airport'

describe Airport do
  let(:mockWeather) { double :Weather }
  subject { described_class.new(20, mockWeather) }
  let(:mockAirplane) { double :Airplane }
  let(:mockAirplane2) { double :Airplane }
  let(:mockAirplane3) { double :Airplane }

  it 'instructs a plane to land at the airport' do
    allow(mockWeather).to receive(:stormy).and_return(false)
    expect(subject.land_plane(Airplane.new)).to be_a_kind_of(Array)
  end

  it 'expects everything landed at the airport to be a Plane' do
    allow(mockWeather).to receive(:stormy).and_return(false)
    7.times { subject.land_plane(Airplane.new) }
    expect(subject.land_plane(Airplane.new)).to all(be_an(Airplane))
  end

  it 'expects a plane to take off from an airport and return that it has taken off' do
    allow(mockWeather).to receive(:stormy).and_return(false)
    subject.land_plane(:mockPlane)
    expect(subject.take_off(:mockPlane)).to eq 'airplane has taken off and is no longer in the airport'
  end

  it 'tests that if we have 2 planes, 1 fles off, then we have 1 left at the airport' do
    allow(mockWeather).to receive(:stormy).and_return(false)
    subject.land_plane(:mockPlane)
    subject.land_plane(:mockPlane2)
    subject.land_plane(:mockPlane3)
    subject.take_off(:mockPlane)
    expect(subject.planes.length).to eq 2
    expect(subject.planes).to eq [:mockPlane2,:mockPlane3]
  end

  it 'raises an error preventing planes from taking off if stormy' do
    allow(mockWeather).to receive(:stormy).and_return(true)
    expect { subject.take_off(:mockPlane) }.to raise_error('Weather is stormy: no planes are to take off')
  end

  it 'raises an error preventing planes from landing if stormy' do
    allow(mockWeather).to receive(:stormy).and_return(true)
    expect { subject.land_plane(:mockPlane) }.to raise_error('Weather is stormy: no planes are to land')
  end

  it 'raises an error when the airport is full' do
    allow(mockWeather).to receive(:stormy).and_return(false)
    expect { 21.times { subject.land_plane(Airplane.new) } }.to raise_error('The airport is full')
  end

  it 'expects the airplane to allow 50 planes to land if we set capacity to 50' do
    weather = double('weather', :stormy => false)
    gatwick = Airport.new(50, weather)
    50.times { gatwick.land_plane(Airplane.new) }
    expect(gatwick.planes.size).to eq 50
  end

  it 'raises an error if you try to land a plane when it is already in the airport' do
    allow(mockWeather).to receive(:stormy).and_return(false)
    subject.land_plane(:mockPlane)
    expect { subject.land_plane(:mockPlane) }.to raise_error('This airplane is already in the airport')
  end
end
