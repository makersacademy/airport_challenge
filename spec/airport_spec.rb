require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  it 'allows planes to land at it' do
    subject.land plane
    expect(subject.parked_planes[-1]).to eq plane
  end

  it 'allows planes to take off from it' do
    subject.land plane
    subject.leave plane
    expect(subject.parked_planes).not_to include plane
  end

end
