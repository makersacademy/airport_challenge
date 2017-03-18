require 'airport'

describe Airport do

  let (:plane) {double :plane}

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'can confirm a plane has landed' do
    expect(subject.land(plane)).to eq plane
  end

end
