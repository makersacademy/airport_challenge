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

  it 'will respond to the method land with  1 argument ' do
    airport_name = Airport.new
    expect(airport_name).to respond_to(:land).with(1).argument
  end

  it 'will allow the method land to land a plane' do
    airport_name = Airport.new
    plane = Plane.new
    expect(airport_name.land(plane)). to eq plane
  end

end
