require 'weather'

describe Weather do
  it { is_expected.to respond_to(:condition) }
  it "generates storm probabilities" do
    expect(subject.storm_probability).to be_an_instance_of(Fixnum)
  end
  describe "#condition" do
    it "converts 91..100 to one" do
      allow(subject).to receive(:storm_probability) { 91 }
      expect(subject.condition).to eq(1)
    end
    it "converts 0..90 to zero" do
      allow(subject).to receive(:storm_probability) { 90 }
      expect(subject.condition).to eq(0)
    end
  end
  describe "#weather_report" do
    it "reports sunny when storm probabilty is less than 91" do
      allow(subject).to receive(:storm_probability) { 90 }
      expect(subject.weather_report).to eq(:sunny)
    end
    it "reports stormy when storm probabilty is greater than 90" do
      allow(subject).to receive(:storm_probability) { 91 }
      expect(subject.weather_report).to eq(:stormy)
    end
  end
end
