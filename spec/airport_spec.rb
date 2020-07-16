require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  it 'Stores planes' do
    subject.planes << plane
    expect(subject.planes[0]).to eq plane
  end

  it 'returns "plane is still grounded" if plane has not departed' do
    allow(plane).to receive(:grounded_in?) { true }
    expect(subject.confirm_departure(plane)).to eq "#{plane} is still grounded"
  end

  it 'Confirms departure of planes' do
    allow(plane).to receive(:grounded_in?) { false }
    expect(subject.confirm_departure(plane)).to eq "#{plane} has departed"
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
