require 'plane'
require 'airport'

describe Airport do
  let(:jfk) { Airport.new }
  let(:airbus380) { Plane.new }
  it 'lands planes' do
    jfk.land_plane(airbus380)
    expect(airbus380.landed?).to eq true
    puts "A plane has landed at the airport" if airbus380.landed?
  end
  it 'instructs planes to take off' do
    jfk.land_plane(airbus380)
    jfk.take_off(airbus380)
    expect(airbus380.landed?).to eq false
    puts "The plane has taken off" unless airbus380.landed?
  end
end
