require './lib/plane'
require './lib/airport'

describe Airport do
  it 'has random weather' do
    #write an actual proper test for this!
    expect(subject).to respond_to(:weather)
  end

  it 'houses landed planes' do
    expect(subject.planes[0]).to be_a(Plane)
  end

  it 'has a default plane capcity' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'has capacity that can be changed' do
    subject.capacity(20)
    expect(subject.capacity).to eq(20)
  end

end
