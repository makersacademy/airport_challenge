require_relative '../docs/plane.rb'
require_relative '../docs/airport.rb'
require 'pry'

describe Plane do

  let(:airport) { double(:airport) }
  let(:hanger)  { [] }

  it 'can land at an airport' do
    expect(subject.respond_to?(:land)).to eq true
  end

  it 'can takeoff from an airport' do
    expect(subject.respond_to?(:takeoff)).to eq true
  end

  it 'can confirm that once its taken off its no longer at the airport' do
    expect(subject.status).to eq "flying"
  end

  it 'can confirm when in airport that its at the airport' do
    plane = Plane.new("airport")
    expect(plane.status).to eq "airport"
  end

  it 'wont takeoff if the weather is stormy' do
    plane = Plane.new
    allow(plane).to receive(:check_weather).and_return("stormy")
    expect { plane.takeoff(airport) }.to raise_error "Error: Adverse weather conditions"
  end

  it 'wont land if the weather is stormy' do
    plane = Plane.new
    allow(plane).to receive(:check_weather).and_return("stormy")
    expect { plane.land(airport) }.to raise_error "Error: Adverse weather conditions"
  end

  it 'wont takeoff if its already flying' do
    plane = Plane.new
    allow(plane).to receive(:check_weather).and_return("sunny")
    expect { plane.takeoff(airport) }.to raise_error "Error: Already flying"
  end

  it 'wont land if its already at the airport' do
    plane = Plane.new("airport")
    allow(plane).to receive(:check_weather).and_return("sunny")
    expect { plane.land(airport) }.to raise_error "Error: Already at the airport"
  end

  it 'can check the current weather' do
    expect(subject.check_weather).to eq('sunny').or(eq('stormy'))
  end

# will need to sub Airport
  it 'can not land when airport if full' do
    plane = Plane.new
    airport = Airport.new
    airport.hanger.push(Plane.new)
    allow(plane).to receive(:check_weather).and_return("sunny")
    expect { plane.land(airport) }.to raise_error "Error: Airport is full"
  end

end
