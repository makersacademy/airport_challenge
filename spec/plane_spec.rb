require 'plane'

describe Plane do
  it {is_expected.to respond_to :flying? }

  describe "initialization" do
    it "defaults to landed (not flying)" do
      expect(subject.flying?).to be false
    end
  end

end
