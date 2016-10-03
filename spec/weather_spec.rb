require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe "#stormy?" do

    before(:each) do
      srand(0)
    end

    it { is_expected.to respond_to(:stormy?) }

    it "returns false when it is sunny" do
      expect(subject.stormy?).to eq false
    end

    it "returns true when it is stormy" do
      subject.stormy?
      expect(subject.stormy?).to eq true
    end

  end

end
