require 'plane'

describe Plane do
  context "does the plane dock into the airport when it lands?" do
    it { is_expected.to respond_to(:land).with(1).argument}
  end
end
