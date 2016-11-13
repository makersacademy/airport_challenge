require 'weather'

describe Weather do

  describe "outputting the weather" do

    it { is_expected.to respond_to(:stormy?) }

    it "returns true" do
      expect(subject.stormy?).to be true
    end

  end

  describe "randomizing the weather" do
    it { is_expected.to respond_to(:randomize) } 
  end

end
