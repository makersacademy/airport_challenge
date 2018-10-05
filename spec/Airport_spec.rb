require './lib/Airport.rb'

describe Airport do

  it 'Should land a plane at the Airport' do
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:forecast) { 'Calm' }
    expect(subject.land(plane)).to eq [plane]
  end

  it 'Should make a plane at the Airport take off and check its no longer there' do
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:forecast) { 'Calm' }
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.hangar).to eq 'empty'
  end

  it "Plane can't take off if forecast is stormy" do
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:forecast) { 'Stormy' }
    expect { subject.take_off(plane) }.to raise_error "BAD WEATHER: can't take off"
  end

  it "Plane can't land if forecast is stormy" do
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:forecast) { 'Stormy' }
    expect { subject.land(plane) }.to raise_error "BAD WEATHER: can't land"
  end

  it "Plane can't land if hangar full" do
    heathrow = Airport.new
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:forecast) { 'Calm' }
    heathrow.land(plane)
    expect { heathrow.land(Plane.new) }.to raise_error "Can't land: HANGAR FULL"
  end
end

describe 'initialisation' do
  heathrow = Airport.new
  plane = Plane.new
  it 'should have a plane in the hangar' do
    allow_any_instance_of(Weather).to receive(:forecast) { 'Calm' }
    heathrow.land(plane)
    expect(heathrow.hangar).to eq [plane]
  end
end
