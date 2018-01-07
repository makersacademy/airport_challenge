require 'airport'

describe 'Airport capacity' do
  let(:weather) { Weather.new }
  let(:airport) { Airport.new(weather) }

  it 'has default' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'allows default capacity to be amended' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    airport.capacity = 25
    expect(airport.capacity).to eq 25
  end
end
