require './lib/plane'
require './lib/airport'

describe Airport do
  let(:plane) {double("plane")}

  it 'has weather' do
    expect(subject).to respond_to(:weather)
  end

  it "has no planes unless some have landed" do
    expect(subject.planes).to eq([])
  end

  it 'can add planes to its list' do
    subject.add(plane)
    expect(subject.planes).to include(plane)
  end

  it 'can remove planes from its list' do
    subject.remove(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'has a default plane capcity' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'has capacity that can be changed' do
    subject.capacity = 20
    expect(subject.capacity).to eq(20)
  end

end
