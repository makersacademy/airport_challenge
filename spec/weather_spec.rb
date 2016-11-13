require 'weather'

describe Weather do

  describe "outputting the weather" do

    it "returns stormy" do
      allow(subject).to receive(:stormy?).and_return true
    end

  end

  describe "randomizing the weather" do
    it "outputs stormy" do
      allow(subject).to receive(:randomize).and_return(:stormy)
      expect(subject.randomize).to be :stormy
    end
    it "outputs clear" do
      allow(subject).to receive(:randomize).and_return(:clear)
      expect(subject.randomize).to be :clear
    end
  end

end
