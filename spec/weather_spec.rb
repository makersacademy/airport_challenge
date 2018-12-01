require "weather"

describe Weather do
  
  it "should return 1 when it's sunny" do
    allow(subject).to receive(:forecast).and_return(Weather::SUNNY)
    expect(subject.forecast).to eq(Weather::SUNNY)
  end

  it "should return 2 when it's sunny" do
    allow(subject).to receive(:forecast).and_return(Weather::STORMY)
    expect(subject.forecast).to eq(Weather::STORMY)
  end

  it "should return true if the weather is sunny" do
    weather = Weather::SUNNY
    expect(subject.is_sunny?(weather)).to eq true
  end

  it "should return false if the weather is not sunny" do
    weather = Weather::STORMY
    expect(subject.is_sunny?(weather)).to eq false
  end

end
