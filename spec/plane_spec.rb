require 'plane'

describe Plane do
  context 'instructs plane to' do
    it { is_expected.to respond_to :land }
  end
  it { is_expected.to respond_to :take_off }
end
