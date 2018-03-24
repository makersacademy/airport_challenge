require 'airport'
require 'weather'
describe Airport do
  it 'starts with no planes' do
    expect(subject.planes).to eq []
  end
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'could have custom capacity' do
    airport = Airport.new(100)
    expect(airport.capacity).to eq 100
  end
  it 'has random weather' do
    arr = []
    50.times { arr << subject.stormy? }
    expect(arr).to include true && false
  end
  it 'gets full' do
    plane = double(:plane)
    25.times { subject.planes << plane }
    expect(subject.full?). to eq true
  end
  it 'gets full with custom capacity' do
    airport = Airport.new(50)
    plane = double(:plane)
    51.times { airport.planes << plane }
    expect(airport.full?).to eq true
  end
end
