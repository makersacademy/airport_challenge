
require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:plane) }

  it 'responds to landing_plane' do
    expect(subject).to respond_to :landing_plane
  end

  it 'plane takes off from airport' do
    plane = subject.landing_plane
    expect(subject).to respond_to :take_off
  end



end
