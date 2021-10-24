require_relative '../lib/airport'
require_relative '../lib/plane'

describe Airport do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:land) { airport.landing(plane) }
  let(:take_off) { airport.take_off(plane) }
  before do
    allow(Airport).to receive(:stormy?) {false}
  end

  it 'stores a landed plane' do
    land
    expect(airport.planes).to eq ([plane])
  end

  it 'prevents landing when airport is full' do
    3.times do
      plane = Plane.new
      airport.landing(plane)
    end
    expect{ land }.to raise_error 'The airport is full.'
  end

  it 'planes location is changed to that of the airport' do
    expect {land}.to change {plane.location}.from('airborne').to(airport)
  end

  it 'planes location is changed to airborne' do
    land
    expect {take_off}.to change {plane.location}.from(airport).to('airborne')
  end

  it 'allows capacity to be set' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq(5)
  end

  it 'set default capacity to 3' do
    expect(airport.capacity).to eq(3)
  end

  it 'planes can only take-off from airport they are in' do
    expect{subject.take_off(plane)}.to raise_error 'You are not at this airport'
  end

  it 'prevents take-off when weather is stormy' do
    land
    allow(Airport).to receive(:stormy?) {true}
    expect{take_off}.to raise_error 'It is too stormy'
  end

  it 'prevents landing when stormy' do
    allow(Airport).to receive(:stormy?) {true}
    expect{land}.to raise_error 'It is too stormy'
  end

end
