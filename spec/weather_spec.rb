require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }

  describe "#stormy?" do
    it "returns true or false depending on weather it's stormy or not" do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end

end
