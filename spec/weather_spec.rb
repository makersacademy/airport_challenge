require 'weather'

describe Weather do
  it "returns a forecast" do
    srand(1)
    expect(subject.report_weather).to eq(:sunny)
  end

  it "returns a forecast" do
    srand(1)
    expect(subject.stormy?).to eq(false)
  end
end