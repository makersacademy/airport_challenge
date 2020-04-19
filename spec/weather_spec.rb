require 'weather'

describe Weather do

=begin
  it "Expects weather to be a class" do
    weather = Weather.new
    expect(subject).to exist
  end
=end

  it "Expects weather to respond to the method stormy?" do
    weather = Weather.new
    expect(weather).to respond_to(:stormy?)
  end

  it "Will return stormy weather" do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(true)

    expect(weather.stormy?).to eq true
  end

  it "Will return sunny weather" do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(false)

    expect(weather.stormy?).to eq false
  end

end
