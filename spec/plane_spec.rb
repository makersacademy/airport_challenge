require 'plane'

describe Plane do

  let(:airport) { Airport.new }
  let(:weather) { double("weather") }

  it 'can only land if it is not already landed' do
    subject.land(airport)
    expect { subject.land(airport) }.to raise_error "plane already landed"
  end

  it 'can only fly if it is not already flying' do
    expect { subject.take_off(airport) }.to raise_error "plane already flying"
  end

  it 'can only take off if it is in the airport' do
    airport2 = Airport.new
    subject.land(airport)
    expect { subject.take_off(airport2) }.to raise_error "plane not in this airport"
  end

  it 'will prevent takeoff when the weather is stormy' do
    subject.land(airport)
    allow(weather).to receive(:state) { :stormy }
    subject.weather = weather.state
    expect { subject.take_off(airport) }.to raise_error "take off is prevented in stormy weather"
  end

  it 'will prevent landing when the weather is stormy' do
    allow(weather).to receive(:state) { :stormy }
    subject.weather = weather.state
    expect { subject.land(airport) }.to raise_error "landing is prevented in stormy weather"
  end
end
