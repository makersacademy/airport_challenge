require 'plane'

describe Plane do
  context 'confirms plane status' do
    it { is_expected.to respond_to :landed? }
  end
  it { is_expected.to respond_to :departed? }
end
