require './lib/airport.rb'

describe Airport do
  let(:plane) {double(:plane)}
  let(:airport) {Airport.new}

describe 'Error testing' do
  before(:each) do
    allow(airport).to receive(:weather_generator).and_return(true)
  end

  it 'raises error if stormy' do
    #plane = Airplane.new
  #  allow(Kernel).to receive(:rand).and_return(80)
    #subject.land_plane(plane)
    expect {airport.land_plane plane}.to raise_error("Storm preventing takeoff and landing.")
    end
end

describe '#land_plane' do
  before(:each) do
    allow(airport).to receive(:weather_generator).and_return(false)
  end
  it {is_expected.to respond_to :land_plane }
  it 'actively lands planes' do

  airport.land_plane(plane)
  expect(airport.landed_planes).to include(plane)
  end
  it 'prints confirmation of landing' do
  #  allow(Kernel).to receive(:rand).and_return(50)
    expect(airport.land_plane(plane)).to include("The plane has landed")
  end
end

describe '#takeoff' do
  it {is_expected.to respond_to :takeoff}
  before(:each) do
    allow(airport).to receive(:weather_generator).and_return(false)
  end

  it 'makes a plane take off from airport' do

  #  allow(Kernel).to receive(:rand).and_return(50)
    airport.land_plane(plane)
    expect(airport.landed_planes).to include(plane)
    airport.takeoff
    expect(airport.landed_planes).to_not include(plane)
  end
  it 'prints confirmation of takeoff' do
#    allow(Kernel).to receive(:rand).and_return(50)
    airport.land_plane(plane)
    expect(airport.takeoff).to include("The plane has left")
  end


  it 'should raise an error if airport is full' do

    allow(airport).to receive(:weather_generator).and_return(false)
    airport.capacity.times{airport.land_plane plane}
    expect {airport.land_plane plane}.to raise_error('airport is full')
  end

end

  #before do
  #  weather_today = "Stormy"
  #end


end
