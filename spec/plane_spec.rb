require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to :landed? }

  it 'can confirm takeoff' do
    plane.takeoff
    expect(plane).not_to be_landed
  end
end
