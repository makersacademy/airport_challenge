require 'airport'

describe Airport do
  describe "landing plane tests" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end
end
