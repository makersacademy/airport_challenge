require 'plane'
require 'airport'

describe Airport do

    let(:plane) { Plane.new } # place in required areas to allow status differences
    let(:airport) {Airport.new}

  it { should respond_to :clear_landing, :clear_takeoff, :weather }

  it 'clears for landing' do # add method stub for weather
    plane.land(subject)
    expect(subject.planes[0]).to eq plane
  end

  it 'clears for takeoff' do # add method stub for weather
    plane.takeoff(subject)
    expect(subject.planes).to be_empty
  end

  it 'sets the weather' do # fix - only accepts 'sunny' at present
    expect(subject.weather).to eq ('sunny'||'stormy')
  end

  it 'denies permission to land' do # fix double/method stub
    gatwick = double(:airport, weather: 'stormy')
    expect{ plane.land(gatwick) }.to raise_error "#{plane} unable to land due to poor weather conditions"
  end

  it 'denies permission for takeoff' do # fix double/method stub
    gatwick = double(:airport, weather: 'stormy')
    airbus.land(gatwick)
    expect{ airbus.takeoff(gatwick) }.to raise_error "#{plane} has been grounded due to poor weather conditions"
  end
end
