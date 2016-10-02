require 'airport'
require 'plane'

describe 'As an air traffic controller I' do

  before do
    @heathrow = Airport.new
    @city = Airport.new(5)
    @concorde = Plane.new
    @jumbo = Plane.new
    allow(@heathrow).to receive(:weather_index).and_return 0
    @concorde.land(@heathrow)
    @jumbo.land(@heathrow)
  end

  it 'can instruct a plane to land at an airport' do
    expect(@heathrow.plane_present?(@concorde)).to eq true
    expect(@heathrow.plane_present?(@jumbo)).to eq true
  end
  it 'can confirm that it has landed' do
    expect(@concorde.status).to eq "landed"
    expect(@jumbo.status).to eq "landed"
  end
  it 'can instruct a plane to take off from an airport' do
    @concorde.take_off
    expect(@concorde.status).to eq "flight in progress"
  end
  it 'can confirm the plane is no longer in the airport' do
    @concorde.take_off
    expect(@heathrow.plane_present?(@concorde)).to eq false
  end
  it 'can prevent takeoff when weather is stormy' do
    allow(@heathrow).to receive(:weather_index).and_return 9
    expect{@jumbo.take_off}.to raise_error "Plane cannot take off due to poor weather"
  end
  it 'can prevent landing when weather is stormy' do
    allow(@heathrow).to receive(:weather_index).and_return 9
    expect{Plane.new.land(@heathrow)}.to raise_error "Plane cannot land due to poor weather"
  end
  it 'can override default capacity as appropriate' do
    allow(@city).to receive(:weather_index).and_return 0
    expect(@city.capacity).to eq 5
  end
  it 'can prevent landing if airport is at max capacity' do
    allow(@city).to receive(:weather_index).and_return 0
    5.times {Plane.new.land(@city)}
    expect {Plane.new.land(@city)}.to raise_error
  end
end
