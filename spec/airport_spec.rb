require './lib/airport'

describe Airport do

  subject(:airport) { Airport.new }

  it 'responds to #land method' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane).join).to eq "#{plane}"
  end

  it 'plane takes off from the airport and confirms departure' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "#{plane} has departed the airport"
  end

  it "checks whether airport has space (contains < 3 planes)" do
    subject.land(Plane.new)
    subject.land(Plane.new)
    subject.land(Plane.new)
    expect(subject.has_space?).to eq false
  end

end
