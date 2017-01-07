require 'airport'

describe Airport do
  it 'Can hold planes' do
    expect(subject).to respond_to :planes
  end
  it 'Has a maximum capacity of planes that it can hold' do
    expect(subject).to respond_to :capacity
    expect(subject.capacity).not_to be_nil
  end
end
