require 'airport'

describe Airport do
  it 'has a default capacity of 10 planes' do
    expect(subject.capacity).to equal(10)
  end
end