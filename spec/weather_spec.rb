require "weather"

describe Weather do

  it "should respond to the method forecast" do
    expect(subject).to respond_to :forecast
  end

  it "should return 1 when it's sunny" do
    allow(subject).to receive(:forecast).and_return(Weather::SUNNY)
    expect(subject.forecast).to eq(Weather::SUNNY)
  end

  it "should return 2 when it's sunny" do
    allow(subject).to receive(:forecast).and_return(Weather::STORMY)
    expect(subject.forecast).to eq(Weather::STORMY)
  end

end
