require 'airport'

describe Airport do
  it 'Returns true if weather is stormy' do
    weather = double("weather")
    allow(weather).to receive(:condition).and_return('stormy')
    airport = Airport.new(weather)
    # used .to eq over .to be_ for legibility
    expect(airport.stormy?).to eq(true)
  end
end
