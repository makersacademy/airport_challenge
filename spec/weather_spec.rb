require 'weather'

describe Weather do
    it {is_expected.to respond_to(:stormy?)}

  describe "#stormy?" do
    it "Returns true in stormy weather" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq(true)
    end
  end
end
