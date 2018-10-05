require 'airport'

describe Airport do
  let(:plane) {double :plane}
  it 'A plane can land' do
    expect(subject.land(plane)).to eq plane
  end

  it 'A plane can take off' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

end
