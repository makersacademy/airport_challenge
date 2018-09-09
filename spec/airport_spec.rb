require 'airport'

describe Airport do
  let(:mockWeather) { double :Weather }
  let(:mockWeather2) { double :Weather }
  subject { described_class.new(20, mockWeather) }
  let(:mockAirplane) { double :Airplane, :lands => true, :takes_off => false }

  before(:each) do
    allow(mockWeather).to receive(:stormy).and_return(false)
    allow(mockWeather2).to receive(:stormy).and_return(false)
    # allow(mockAirplane).to receive(:lands).and_return(true)
    @airplane = double(:Airplane, :lands => true, :takes_off => false, :grounded => false)
    @airplane2 = double('Airplane', :lands => true, :takes_off => false, :grounded => false)
    @airplane3 = double('Airplane', :lands => true, :takes_off => false, :grounded => false)
  end

  it 'instructs a plane to land at the airport' do
    expect(subject.land_plane(@airplane)).to be_a_kind_of(Array)
  end

  it 'expects everything landed at the airport to be a Plane' do
    7.times { subject.land_plane(Airplane.new) }
    expect(subject.land_plane(Airplane.new)).to all(be_an(Airplane))
  end

  it 'expects a plane to take off from an airport and return that it has taken off' do
    subject.land_plane(@airplane)
    expect(subject.take_off(@airplane)).to eq 'airplane has taken off and is no longer in the airport'
  end

  it 'tests that if we have 2 planes, 1 fles off, then we have 1 left at the airport' do
    subject.land_plane(@airplane)
    subject.land_plane(@airplane2)
    subject.land_plane(@airplane3)
    subject.take_off(@airplane)
    expect(subject.planes.length).to eq 2
    expect(subject.planes).to eq [@airplane2, @airplane3]
  end

  it 'raises an error preventing planes from taking off if stormy' do
    allow(mockWeather).to receive(:stormy).and_return(true)
    expect { subject.take_off(:mockPlane) }.to raise_error('Weather is stormy: no planes are to take off')
  end

  it 'raises an error preventing planes from landing if stormy' do
    allow(mockWeather).to receive(:stormy).and_return(true)
    expect { subject.land_plane(@airplane) }.to raise_error('Weather is stormy: no planes are to land')
  end

  it 'raises an error when the airport is full' do
    expect { 21.times { subject.land_plane(Airplane.new) } }.to raise_error('The airport is full')
  end

  it 'expects the airplane to allow 50 planes to land if we set capacity to 50' do
    weather = double('weather', :stormy => false)
    gatwick = Airport.new(50, weather)
    50.times { gatwick.land_plane(Airplane.new) }
    expect(gatwick.planes.size).to eq 50
  end

  it 'raises an error if you try to land a plane when it is already in the airport' do
    subject.land_plane(@airplane)
    expect { subject.land_plane(@airplane) }.to raise_error('This airplane is already in the airport')
  end

  it 'errors when you try to land a plane that is already landed in another airport; assumes weather is fine' do
    @airplane = double(:Airplane, :lands => true, :takes_off => false, :grounded => true)
    expect { subject.land_plane(@airplane) }.to raise_error('This airplane is not in the air')
  end
end
