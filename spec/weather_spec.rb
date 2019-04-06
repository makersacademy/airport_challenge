require 'weather'

describe Weather do
  before :each do
    subject { described_class.new }
  end

  describe '#stormy?' do
    it "check the weather being stormy " do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.stormy?). to eq true
    end

    it "check the weather being stormy " do
      allow(subject).to receive(:rand).and_return(5)
      expect(subject.stormy?). to eq false
    end
  end
end
