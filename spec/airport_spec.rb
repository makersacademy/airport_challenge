require 'airport'

describe Airport do

  let(:plane) {double(:plane)}

  it 'has default capacity' do
    Airport::DEFAULT_CAPACITY.times {subject.planes << plane}
    expect(subject.full?).to eq true
  end

  it 'has a capacity that can be overwritten' do
    new_capacity = 56
    airport = Airport.new(max_capacity: new_capacity)
    new_capacity.times {subject.planes << plane}
    expect(subject.full?).to eq true
  end

end
