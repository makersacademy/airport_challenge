require 'airport'

describe Airport do
  context 'confirms planes status' do
    it { is_expected.to respond_to :landed? }
  end
  it { is_expected.to respond_to :takeoff? }
end
