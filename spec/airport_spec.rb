require "airport"

describe Airport do
  it "contains planes" do
    it { is_expected.to respond_to :planes }
  end
end
