require 'airport'

describe Airport do
  describe 'instruct a plane to land at an airport' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

end
