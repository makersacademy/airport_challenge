require 'airport'

describe Airport do
  it 'can create a instance' do
    expect(Airport.new).to be_truthy
  end
  it 'has a collection planes' do
    is_expected.to respond_to(:planes)
    expect(subject.planes).to eq []
  end
  it 'should have a capacity' do
    is_expected.to respond_to(:capacity)
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'should let you change capacity on iniitilazation' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end

end
