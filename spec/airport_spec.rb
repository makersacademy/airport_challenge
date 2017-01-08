require 'Airport'

describe Airport do
  let(:airport) { Airport.new }

  it 'initialises without planes' do
    expect(airport.planes).to eq []
  end

  it 'plane can land at the airport' do
    plane = double(:plane)
    expect(plane).to receive(:land!)
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it 'allows a plane to take off' do
    plane = double(:plane, land!: nil)
    airport.land(plane)
    expect(plane).to receive(:take_off!)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end

  it 'can check the weather' do
    possible_weather = ["sunny", "stormy"]
    expect(possible_weather).to include(airport.check_weather)
  end



end
