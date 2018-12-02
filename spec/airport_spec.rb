require 'airport'

RSpec.describe Airport do

  airport = Airport.new

  it 'will respond to airport_space method' do
    expect(airport).to respond_to(:airport_space)
  end

  it 'will respond to airport_full method' do
    expect(airport).to respond_to(:airport_full?)
  end

  it 'will respond to confirm_takeoff method' do
    expect(airport).to respond_to(:confirm_takeoff)
  end

  it 'will have a default capacity of 1000' do
    expect(airport.capacity).to eq 1000
  end

end
