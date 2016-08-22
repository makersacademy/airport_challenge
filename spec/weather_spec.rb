require 'weather'

describe Weather do

  subject {described_class.new}

  describe "stormy?" do

    before(:each) do
      srand(0) #seed is for proper testing
    end

    it "responds to the method call" do
      expect(subject).to respond_to(:stormy?)
    end

    it "returns false if the weather is sunny" do
      expect(subject.stormy?).to eq false
    end

    it "returns true if the weather is stormy" do
      subject.stormy?
      expect(subject.stormy?).to eq true
    end
  end
end
