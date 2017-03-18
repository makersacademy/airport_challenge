require 'weather'

describe Weather do
  describe "initialization" do

  end

  describe "#stormy?" do
    it "is stormy" do
      expect ( subject.stormy? ).to be_true
    end
  end

end
