require 'airport'

describe Airport do
  it 'has a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end

  it 'confirms if the capacity is full' do
    expect(subject.full?).to be false
  end

  it 'confirms if there are no planes in the airport' do
    expect(subject.empty?).to be true
  end
end
