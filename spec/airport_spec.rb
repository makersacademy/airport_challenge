require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  it 'defaults a capacity' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { airport.store(plane) }
    expect { airport.store(plane) }.to raise_error "The airport is full"
  end

  it 'changes the capacity' do
    capacity = 20
    airport = Airport.new(capacity)
    capacity.times { airport.store(plane) }
    expect { airport.store(plane) }.to raise_error "The airport is full"
  end
end