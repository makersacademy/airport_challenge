require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane }

  it 'land at airport' do
    airport = Airport.new
    expect(airport).to receive(:storm).and_return(false)
    plane = double(:plane)
    expect(airport.land(plane)).to eq [plane]
  end

  it 'take off from airport' do
    airport = Airport.new
    expect(airport).to receive(:storm).and_return(false)
    plane = double(:plane)
    airport.hanger << plane
    expect(airport.take_off).to eq plane
  end

  it 'confirm taken off' do
    airport = Airport.new
    expect(airport).to receive(:storm).and_return(false)
    plane = double(:plane)
    airport.hanger << plane
    airport.take_off
    expect(airport.taken_off?).to eq 0
  end

  it 'prevent take off in stormy weather' do
    airport = Airport.new
    expect(airport).to receive(:storm).and_return(true)
    plane = double(:plane)
    airport.hanger << plane
    expect{airport.take_off}.to raise_error "Can't take off due to stormy weather"
  end

  it 'prevent landing in stormy weather' do
    airport = Airport.new
    expect(airport).to receive(:storm).and_return(true)
    plane = double(:plane)
    expect{airport.land(plane)}.to raise_error "Can't land due to stormy weather"
  end




end
