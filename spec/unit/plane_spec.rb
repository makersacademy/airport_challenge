require 'plane'

RSpec.describe Plane do
  let(:plane) { Plane.new }
  it { is_expected.to respond_to :flying? }
  it { is_expected.to respond_to :set_status }
  it { expect(plane.flying?).to be true }
end
