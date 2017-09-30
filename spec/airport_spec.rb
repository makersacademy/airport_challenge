require 'airport'

describe Airport do
  describe "landing plane tests" do
    it { is_expected.to respond_to :land}
  end
end
