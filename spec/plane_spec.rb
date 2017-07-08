require 'plane'

describe Plane do
  context 'confirms the planes status' do
    it { is_expected.to respond_to :landed? }
  end
  it { is_expected.to respond_to :taken_off? }
end
