require './lib/weather'

describe Weather do
  it { is_expected.to respond_to(:conditions) }

  describe "#conditions" do
    it "generates a sunny weather condition" do
      allow(subject).to receive(:rand).and_return(0)
      expect(subject.conditions).to eq("Sunny")
    end

    it "generates a stormy weather condition" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.conditions).to eq("Stormy")
    end

  end

end