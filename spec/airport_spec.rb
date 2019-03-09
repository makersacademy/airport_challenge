require 'airport'

describe Airport do
  
  # Test that airport responds to land plane method
  it { is_expected.to respond_to :land_plane }

  # Test land plane method takes in argument
  it { is_expected.to respond_to(:land_plane).with(1).argument }

  # Test new airport object has default capacity
  it 'New airport object has default capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq 10
  end

  # Test that capacity can be overriden by system admin
  it 'create new airport with overriden capacity' do
    airport = Airport.new(100)
    expect(airport.capacity).to eq 100
  end

end
