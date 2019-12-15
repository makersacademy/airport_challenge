require 'airport'

describe Airport do
  it 'Responds to iata_code with relevant code' do
    heathrow = Airport.new('LTN')
    expect(heathrow.iata_code).to eq :LTN
  end

  it 'initializes with default airport code' do
    heathrow = Airport.new()
    expect(heathrow.iata_code).to eq :LHR
  end

  it 'Doesnt allow non-available airports to be initialized' do
    expect{Airport.new('ABC')}.to raise_error("Airport not available, please enter allowed airport code.\nThe following airports are available: #{Airport::AVAILABLE_AIRPORTS.join(', ')}")
  end

  it 'Responds with true if airport is full' do
    heathrow = Airport.new('LHR', 2)
    plane = double("plane")
    2.times{heathrow.land_plane(plane)}
    expect(heathrow.airport_at_capacity?).to eq true
  end

  it 'Responds with false if airport has spaces' do
    heathrow = Airport.new('LHR')
    plane = double("plane")
    2.times{heathrow.land_plane(plane)}
    expect(heathrow.airport_at_capacity?).to eq false
  end

  it 'Allows planes to be landed' do
    heathrow = Airport.new('LHR')
    plane = double("plane")
    heathrow.land_plane(plane)
    expect(heathrow.planes).to eq [plane]
  end
end
