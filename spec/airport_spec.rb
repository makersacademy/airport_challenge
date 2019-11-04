require "./lib/airport.rb"
describe Airport do
  it 'makes an instance of the airport class' do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it 'make plane land' do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end
end
