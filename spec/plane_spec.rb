require 'plane'

describe Plane do
  let(:plane) { described_class.new }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :land }
  
  it "when initialize status is :landed" do
    expect(plane.status).to eq :landed
  end
end