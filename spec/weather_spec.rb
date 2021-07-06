require "weather"

describe Weather do

  it "Will raise an error if the weather is stormy." do
    conditions = "Stormy"
    allow(subject).to receive(:conditions).and_raise "To stormy cannot take off/land."
  end

  it "Will generate a random number and return a weather" do
    forecast = 1
    expect(subject.forecast).to eq("Sunny")
  end
end
