require 'airport'

describe Airport do
  let(:mockWeather) { double :Weather }
  subject { described_class.new(20, mockWeather) }

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
    expect(subject.take_off).to eq 'airplane has taken off and is no longer in the airport'
  end

  it 'tests that if we have 6 planes, 4 fly off, then we have 2 left at the airport' do
    allow(mockWeather).to receive(:stormy).and_return(false)
    6.times { subject.land_plane(Airplane.new) }
    4.times { subject.take_off }
    expect(subject.planes.length).to eq 2
  end

  it 'raises an error preventing planes from taking off if stormy' do
    allow(mockWeather).to receive(:stormy).and_return(true)
    expect { subject.take_off }.to raise_error('Weather is stormy: no planes are to take off')
  end

  it 'raises an error preventing planes from landing if stormy' do
    allow(mockWeather).to receive(:stormy).and_return(true)
    expect { subject.land_plane(Airplane.new) }.to raise_error('Weather is stormy: no planes are to land')
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
    boeing = Airplane.new
    subject.land_plane(boeing)
    expect { subject.land_plane(boeing) }.to raise_error('This airplane is already in the airport')
  end
end
