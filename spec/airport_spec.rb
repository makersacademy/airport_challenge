require 'airport'

describe Airport do
  it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
    
  # I want to instruct a plane to land at an airport
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns a plane that has landed' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  # I want to prevent landing when the airport is full 
  
  # I would like a default airport capacity that can be overridden as appropriate

  # I want to prevent takeoff when weather is stormy 

  # I want to prevent landing when weather is stormy 
end
