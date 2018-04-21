require 'airport'

describe Airport do
  context "does the plane land at the airport?" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end
end
