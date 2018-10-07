require './lib/Airport.rb'

describe Airport do
  before(:each) do
    @plane = Plane.new("name")
    @calm_weather = allow_any_instance_of(Weather).to receive(:forecast) { 'Calm' }
  end

  it 'Should land a plane at the Airport' do
    expect(subject.land(@plane)).to eq [@plane]
  end

  it 'Should make a plane at the Airport take off and check its no longer there' do
    subject.land(@plane)
    subject.take_off(@plane)
    expect(subject.hangar).to eq 'empty'
  end

  it "Plane can't take off if forecast is stormy" do
    allow_any_instance_of(Weather).to receive(:forecast) { 'Stormy' }
    expect { subject.take_off(@plane) }.to raise_error "BAD WEATHER: can't take off"
  end

  it "Plane can't land if forecast is stormy" do
    allow_any_instance_of(Weather).to receive(:forecast) { 'Stormy' }
    expect { subject.land(@plane) }.to raise_error "BAD WEATHER: can't land"
  end

  it "Plane can't land if hangar full at DEFAULT CAPACITY" do
    heathrow = Airport.new
    described_class::DEFAULT_CAPACITY.times { heathrow.land(Plane.new("name")) }
    expect { heathrow.land(@plane) }.to raise_error "Can't land: HANGAR FULL"
  end

  it "Plane can't land if hangar full at INITIALIZED CAPACITY" do
    heathrow = Airport.new(30)
    30.times { heathrow.land(Plane.new("name")) }
    expect { heathrow.land(@plane) }.to raise_error "Can't land: HANGAR FULL"
  end

  it "Plane can't land if it has already landed" do
    plane1 = Plane.new("Tom")
    subject.land(plane1)
    expect { subject.land(plane1) }.to raise_error "#{plane1.name} is already in the hangar"
  end

  it "Plane can't land if it has already landed (including multiple planes)" do
    plane1 = Plane.new("Tom")
    plane2 = Plane.new("Terry")
    subject.land(plane1)
    subject.land(plane2)
    subject.take_off(plane1)
    expect { subject.land(plane2) }.to raise_error "#{plane2.name} is already in the hangar"
  end

  it "Plane can't take off if it isn't in the hangar" do
    plane1 = Plane.new("Tom")
    subject.land(plane1)
    subject.take_off(plane1)
    expect { subject.take_off(plane1) }.to raise_error "#{plane1.name} isn't in the hangar"
  end
end

describe 'initialisation' do
  heathrow = Airport.new
  plane = Plane.new("name")
  it 'should have a plane in the hangar' do
    allow_any_instance_of(Weather).to receive(:forecast) { 'Calm' }
    heathrow.land(plane)
    expect(heathrow.hangar).to eq [plane]
  end
end
