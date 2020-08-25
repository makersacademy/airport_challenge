require 'Airport'
describe Airport do
  it 'check if there is an airport' do
    airport = Airport.new
    expect(airport).to be_an_instance_of Airport
  end
end
