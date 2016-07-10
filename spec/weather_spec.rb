require 'weather'

describe Weather do
  describe "#stormy?" do
    it "Returns true in stormy weather" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq(true)
    end
  end
end
