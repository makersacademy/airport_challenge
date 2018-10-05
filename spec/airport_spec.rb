require 'airport'

describe Airport do
  let(:plane) {double :plane}
  it 'lands a plane' do
    expect(subject.land(plane)).to eq plane
  end

end
