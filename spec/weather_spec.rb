require 'weather'

describe Weather do
  describe "stormy?" do

    before(:each) do
      srand(2) #seed is for proper testing
    end

    it "responds to the method call" do
      expect(subject).to respond_to(:stormy?)
    end

    it "returns true if the weather is sunny" do
      expect(subject.stormy?).to eq false
    end

    it "returns false if the weather is stormy" do
      subject.stormy?
      expect(subject.stormy?).to eq true
    end
  end
end
