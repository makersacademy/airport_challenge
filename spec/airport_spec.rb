require 'airport'

describe Airport do
  it 'Responds to iata_code with relevant code' do
    heathrow = Airport.new('LHR')
    expect(heathrow.iata_code).to eq :LHR
  end
  it 'Doesnt allow non-available airports to be initialized' do
    expect{Airport.new('ABC')}.to raise_error("Airport not available, please enter allowed airport code.\nThe following airports are available: #{Airport::AVAILABLE_AIRPORTS.join(', ')}")
  end
end
