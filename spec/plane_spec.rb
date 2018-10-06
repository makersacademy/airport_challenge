require_relative '../docs/plane.rb'

describe Plane do
  plane = Plane.new
  plane2 = Plane.new("airport")
  let(:airport) { double(:airport, name: "airport", capacity: 1, hanger: []) }
  let(:airport2) { double(:airport, name: "airport2", capacity: 1, hanger: []) }

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
    expect { plane2.land(airport) }.to raise_error "Error: Already at airport"
  end

  it 'can check the current weather' do
    expect(subject.check_weather).to eq('sunny').or(eq('stormy'))
  end

  it 'can not land when airport if full' do
    airport.hanger.push(Plane.new)
    allow(plane).to receive(:check_weather).and_return("sunny")
    allow(airport).to receive(:full?).and_return(true)
    expect { plane.land(airport) }.to raise_error "Error: Airport is full"
  end

  it 'can take off from the airport its at' do
    allow(plane).to receive(:check_weather).and_return("sunny")
    allow(airport).to receive(:full?).and_return(false)
    plane.land(airport)
    plane.takeoff(airport)
    expect(plane.status).to eq "flying"
  end

  it 'cannot take off from an airport its not at' do
    allow(plane).to receive(:check_weather).and_return("sunny")
    allow(airport).to receive(:full?).and_return(false)
    plane.land(airport)
    expect { plane.takeoff(airport2) }.to raise_error "Error: Not at that airport"
  end

end
