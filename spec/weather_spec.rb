require 'weather'

describe Weather do
  it "responds to stormy method" do
    expect(subject).to respond_to(:stormy?)
  end
  it "can tell if the weather is stormy" do
    expect(subject.random_weather(10)).to eq true
  end
  it "can tell if the weather is not stormy based on a given number" do
    expect(subject.random_weather(7)).to eq false
  end
end
