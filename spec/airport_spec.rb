require 'Airport'
require 'Plane'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns a success message when we land a plane' do
    expect(subject.land(Plane.new)).to eq "Plane landed"
  end
end
