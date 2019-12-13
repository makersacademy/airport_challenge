require './lib/airport'

describe Airport do
  it 'creates an instance of Airport' do
    airport_name = Airport.new
    expect(airport_name).to be_instance_of Airport
  end
end
