describe 'User Stories' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed
  it 'airports can instruct planes to land at an airport' do
    expect(airport.land(plane)).to eq plane
  end

  it 'confirms that an plane has landed' do

  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'airports can instruct planes to take off from an airport' do

  end

  it 'confirms that a plane has taken off' do

  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it 'prevents takeoff when stormy' do

  end


  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  it 'prevents landing when stormy' do

  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it 'prevents landing when airport is full' do

  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it 'airports have a default capacity' do

  end

  it 'the default capacity can be overridden' do

  end
end
