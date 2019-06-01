require 'airport'

describe Airport do
  it 'has a default capacity of 10 planes' do
    expect(subject.capacity).to equal(10)
  end

  it 'allows the Airport capacity to be changed from the default' do
    subject.capacity = 20
    expect(subject.capacity).to equal(20)
  end
end