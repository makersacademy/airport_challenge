require 'weather'

describe Weather do
  before :each do
    subject { described_class.new }
  end

  describe '#stormy?' do
    it "check the weather being stormy " do
      subject.stormy?
      expect(subject.stormy). to eq true
    end
  end
end
