require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).arguments}
  end
end
