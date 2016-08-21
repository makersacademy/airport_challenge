require 'weather'

describe Weather do
  describe "sunny?" do

    before(:each) do
      srand(2) #seed is for proper testing
    end

    it "responds to the method call" do
      expect(subject).to respond_to(:sunny?)
    end

    it "returns true if the weather is sunny" do
      expect(subject.sunny?).to eq true
    end

    it "returns false if the weather is stormy" do
      subject.sunny?
      expect(subject.sunny?).to eq false
    end
  end
end
