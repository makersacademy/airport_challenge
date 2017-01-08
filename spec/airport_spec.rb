require './lib/airport.rb'
require './lib/weather.rb'

describe Airport do

  it 'raises error if stormy' do
    allow(Kernel).to receive(:rand).and_return(90)
    plane = Airplane.new
  #  allow(Kernel).to receive(:rand).and_return(80)
    subject.land_plane(plane)
    expect {subject.stormy?}.to raise_error("Storm preventing takeoff and landing.")
  end
  
describe '#land_plane' do

  it {is_expected.to respond_to :land_plane }
  it 'actively lands planes' do
  allow(Kernel).to receive(:rand).and_return(50)
  plane = Airplane.new
  subject.land_plane(plane)
  expect(subject.landed_planes).to include(plane)
  end
  it 'prints confirmation of landing' do
  #  allow(Kernel).to receive(:rand).and_return(50)
    plane = Airplane.new
    expect(subject.land_plane(plane)).to include("The plane has landed")
  end
end

describe '#takeoff' do
  it {is_expected.to respond_to :takeoff}

  it 'makes a plane take off from airport' do
    allow(Kernel).to receive(:rand).and_return(50)
    plane = Airplane.new
  #  allow(Kernel).to receive(:rand).and_return(50)
    subject.land_plane(plane)
    expect(subject.landed_planes).to include(plane)
    subject.takeoff
    expect(subject.landed_planes).to_not include(plane)
  end
  it 'prints confirmation of takeoff' do
    allow(Kernel).to receive(:rand).and_return(50)
    plane = Airplane.new
#    allow(Kernel).to receive(:rand).and_return(50)
    subject.land_plane(plane)
    expect(subject.takeoff).to include("The plane has left")
  end
  end


  #before do
  #  weather_today = "Stormy"
  #end


end
