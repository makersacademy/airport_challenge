require 'weather'

describe Weather do
  it "returns a forecast" do
    #find a way to stub the value to check for stormy?
    expect(subject.report_weather).to eq(:stormy).or eq(:sunny)
  end
end