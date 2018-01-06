require 'airport'

describe 'Airport capacity' do
  it 'has default' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'allows default capacity to be amended' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    airport.capacity = 25
    expect(airport.capacity).to eq 25
  end
end
