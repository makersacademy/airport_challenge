require 'weather'
describe Weather do
  it { is_expected.to be_kind_of(described_class)}
  it { is_expected.to respond_to(:random_weather_generator) }

  describe '#random_weather_generator' do
    it "returns the weather (mainly sunny)" do
      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(0)
      expect(subject.random_weather_generator).to eq("Sunny")

      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(1)
      expect(subject.random_weather_generator).to eq("Sunny")

      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(2)
      expect(subject.random_weather_generator).to eq("Sunny")

      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(3)
      expect(subject.random_weather_generator).to eq("Stormy")
    end
  end
end
