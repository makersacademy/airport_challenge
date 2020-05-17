require 'plane'
require 'airport'

describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to :flying? }

  it "checks whether a plane is flying" do  
    allow(subject).to receive(:weather) { "sunny" }
    airport.land(subject)
    expect(subject.flying?).to eq false
  end

  it "should tell a plane to land at an airport" do
    expect(subject).to respond_to(:land)
    
  end

  it "should prevent landing if weather is stormy" do
    expect { subject.land(plane) }.to raise_error "Weather stormy, unable to land"
  end

  it "should prevent take-off if weather is stormy" do 
    expect { subject.flying? }.to raise_error "Weather stormy, unable to take-off"
  end

end