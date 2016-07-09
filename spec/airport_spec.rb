require 'airport'

describe Airport do

  it 'has a weather attribute that can be set to stormy' do
    subject.weather = 'stormy'
    expect(subject.weather).to eq 'stormy'
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'has a default capacity that can be changed' do
    airport = Airport.new(20)
    expect(airport.capacity(20)).to eq 20
  end

describe '#initialize' do
  it 'a new airport contains an empty array of planes' do
    airport = Airport.new
    expect(airport.planes).to be_empty
  end
end

end
