require_relative '../docs/plane.rb'
require_relative '../docs/airport.rb'
require 'pry'

describe Plane do
  plane = Plane.new
  plane2 = Plane.new("airport")
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
    expect(plane2.status).to eq "airport"
  end

  it 'wont takeoff if the weather is stormy' do
    allow(plane2).to receive(:check_weather).and_return("stormy")
    expect { plane2.takeoff(airport) }.to raise_error "Error: Adverse weather conditions"
  end

  it 'wont land if the weather is stormy' do
    allow(plane).to receive(:check_weather).and_return("stormy")
    expect { plane.land(airport) }.to raise_error "Error: Adverse weather conditions"
  end

  it 'wont takeoff if its already flying' do
    allow(plane).to receive(:check_weather).and_return("sunny")
    expect { plane.takeoff(airport) }.to raise_error "Error: Already flying"
  end

  it 'wont land if its already at the airport' do
    allow(plane2).to receive(:check_weather).and_return("sunny")
    expect { plane2.land(airport) }.to raise_error "Error: Already at the airport"
  end

  it 'can check the current weather' do
    expect(subject.check_weather).to eq('sunny').or(eq('stormy'))
  end

# will need to sub Airport
  it 'can not land when airport if full' do
    airport = Airport.new("airport")
    airport.hanger.push(Plane.new)
    allow(plane).to receive(:check_weather).and_return("sunny")
    expect { plane.land(airport) }.to raise_error "Error: Airport is full"
  end

  it 'cannot take off from an airport its not at' do
    a1 = Airport.new("a1")
    a2 = Airport.new("a2")
    allow(plane).to receive(:check_weather).and_return("sunny")
    plane.land(a1)
    expect { plane.takeoff(a2) }.to raise_error "Error: Not at that airport"
  end

  it 'can take off from the airport its at' do
    airport = Airport.new("airport")
    plane3 = Plane.new
    allow(plane3).to receive(:check_weather).and_return("sunny")
    plane3.land(airport)
    plane3.takeoff(airport)
    expect(plane3.status).to eq "flying"
  end

end
