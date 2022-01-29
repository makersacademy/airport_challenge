require './lib/weather.rb'

describe Weather do

 it "responds to the stormy method" do
    expect(subject).to respond_to(:stormy?)
 end

 it "tells us whether the weather is stormy" do
    allow(subject).to receive(:weather) { 1 }
    expect(subject.stormy?).to eq true
 end

end

# rspec ./spec/weather_spec.rb:9