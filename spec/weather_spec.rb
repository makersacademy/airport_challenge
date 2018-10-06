require 'weather'

describe Weather do
  describe "#current" do
    it "should be sunny or stormy" do
      expect(subject.current).to eq("Stormy").or eq("Sunny")
    end
  end
  
  describe "#stormy?"
  it "should return true when stormy" do
    allow(subject).to receive(:current).and_return "Stormy"
    expect(subject.stormy?).to eq true
  end

  it "should return false when stormy" do
    allow(subject).to receive(:current).and_return "Sunny"
    expect(subject.stormy?).to eq false
  end
end
