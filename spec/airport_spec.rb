require 'airport'

describe Airport do

  it 'creates a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'lets us over-ride the default capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq(20)
  end



end
