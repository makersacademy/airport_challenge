require 'weather'

RSpec.describe Weather do 
  describe "#stormy?" do
    it "returns true when weather is bad" do
      allow(subject).to receive(:generate).and_return(5)
      expect(subject.stormy?).to be true
    end

    it "returns false when weather is good" do
      allow(subject).to receive(:generate).and_return(2)
      expect(subject.stormy?).to be false
    end
  end

end