require 'weather'

describe Weather do

  describe "outputting the weather" do

    it "returns stormy or clear" do
      expect(subject.stormy?).to be true
    end

  end

  describe "randomizing the weather" do
    it { is_expected.to respond_to(:randomize) }
    it "outputs stormy" do
      allow(subject).to receive(:randomize).and_return(:stormy)
      expect(subject.randomize).to be :stormy
    end
  end

end
