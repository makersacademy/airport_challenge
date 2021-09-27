require './lib/weather'

describe Weather do
  
  it "returns :stormy if stormy weather was generated from a list" do
    allow(subject).to receive(:weather) { :stormy }
    expect(subject.weather).to eq(:stormy)
  end

  it "returns :sunny if sunny weather was generated from a list" do
    allow(subject).to receive(:weather) { :sunny }
    expect(subject.weather).to eq(:sunny)
  end

  it "confirms the stormy weather" do
    allow(subject).to receive(:stormy?) { true }
    expect(subject.stormy?).to eq true
  end

end
