require "Sky"

describe Sky do
  it "has weather that's either stormy or sunny" do
    100.times {
      subject.change_weather
      expect(subject.weather).to eq(:stormy).or eq(:sunny)
    }
  end

  it "has stormy weather if random rolls 1" do
    allow(subject).to receive(:rand) { 1 }
    subject.change_weather
    expect(subject.stormy?).to eq true
  end

  it "has sunny weather if random rolls 5" do
    allow(subject).to receive(:rand) { 5 }
    subject.change_weather
    expect(subject.stormy?).to eq false
  end
end
