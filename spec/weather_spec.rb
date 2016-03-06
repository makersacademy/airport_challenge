require 'weather'

describe Weather do
  describe "#storm" do
    it {is_expected.to respond_to(:storm)}

    it "returns true for values above 7" do
      allow(subject).to receive(:rand){8}
      expect(subject.storm).to eq(true)
    end
  end
end
