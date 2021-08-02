require 'plane'

describe Plane do
  
  let(:airport) { double('airport') }
  let(:weather) { double('weather') }
  
  it "checks if plane is at airport" do
    airport = Airport.new
    allow(airport.send('weather')).to receive(:stormy?) { false }
    airport.send(:planes) << subject
    airport.take_off(subject)
    expect(airport.send(:planes).include?(subject)).to eq(false)
  end
  
end
