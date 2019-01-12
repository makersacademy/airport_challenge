require 'weather'

RSpec.describe Weather do

  it "should respond to stormy weather" do
    expect(subject).to respond_to(:stormy)
  end

  it "should respond to random weather" do
    expect(subject).to respond_to(:random_weather)
  end

  it "should generate a random weather stormy or sunny" do
    allow(subject).to receive(:rand).and_return(3)
    expect(subject.random_weather).to eq ('sunny')
  end

  it "should generate a random weather stormy or sunny" do
    allow(subject).to receive(:rand).and_return(81)
    expect(subject.random_weather).to eq ('stormy')
  end
end
