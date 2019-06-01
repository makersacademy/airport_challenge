require 'airport'

describe Airport do
  it 'has a default capacity of 10 planes' do
    expect(subject.capacity).to equal(10)
  end

  it 'allows the Airport capacity to be changed from the default' do
    subject.capacity = 20
    expect(subject.capacity).to equal(20)
  end

  it 'allows the number of planes at the airport to be increased by 1' do
    subject.add_plane
    expect(subject.planes).to eql(1)
  end

end