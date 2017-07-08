require 'airport'

describe Airport do
  context 'it instructs plane to' do
    it { is_expected.to respond_to :land }
  end
  it { is_expected.to respond_to :takeoff }
end
