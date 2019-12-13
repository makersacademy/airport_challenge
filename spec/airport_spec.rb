require './lib/airport'

describe Airport do
  it 'creates an instance of Airport' do
    airport_name = Airport.new
    expect(airport_name).to be_instance_of Airport
  end

  it 'will make Airport instance to respond to the land method' do
    airport_name = Airport.new
    expect(airport_name). to respond_to(:land)
  end
end
