require 'weather'

describe Weather do
  it { is_expected.to be_a Weather }

  describe "#generate_weather" do
    it "returns a number showing severity of weather" do
      expect(subject.generate_weather).to be_within(5).of(5)
    end

    it 'returns stormy as false at 8 rating or below' do
      allow(Kernel).to receive(:rand).and_return 8
      expect(subject.stormy?).to be false
    end

    it 'returns stormy above 9 rating' do
      allow(Kernel).to receive(:rand).and_return 9
      expect(subject.stormy?).to be true
    end
  end
end
