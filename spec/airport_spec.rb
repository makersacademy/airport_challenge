require "airport"

describe Airport do
  it 'sets capacity to arg value when initialised with a numerical arg' do
    expect(Airport.new(10).capacity).to eq 10
    expect(Airport.new("10").capacity).to eq 10
    expect(Airport.new(10.75).capacity).to eq 10
  end

  it 'sets capacity to default when initialised without argument' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'returns error when initialised with non-numerical arg' do
    expect { Airport.new("ten") }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
    expect { Airport.new([10]) }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end

  it 'returns error when initialised with arg == 0' do
    expect { Airport.new(0) }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end
end
