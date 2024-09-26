require_relative "../lib/plane"

describe Plane do
  describe "#flying" do
    it { is_expected.to respond_to(:flying) }
  end
end
