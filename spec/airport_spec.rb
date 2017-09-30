require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  it 'is possible for planes to land at it' do
    subject.land plane
    expect(subject.parked_planes[-1]).to eq plane
  end

  it 'is possible for planes to take off from it' do
    subject.leave plane
    expect(subject.parked_planes).not_to include plane
  end

end
