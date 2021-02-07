require 'airport'
require 'plane'
require 'weather'

describe Airport do

  # Plane instance
  plane = Plane.new

  # Weather doubles
  let(:weather_fine) { double :weather, :stormy? => false }
  let(:weather_stormy) { double :weather, :stormy? => true }

  # Check methods exist
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:takeoff) }

  # User Stories
  it 'plane should be able to land at airport' do
    plane.flying = true

    expect(subject.land(plane, weather_fine)).to eq "Plane landed"
    expect(subject.parked.include?(plane)).to eq true
  end

  it 'plane should be able to take off from airport' do
    plane.flying = true
    subject.land(plane, weather_fine)

    expect(subject.takeoff(plane, weather_fine)).to eq "Plane departed"
    expect(subject.parked.include?(plane)).to eq false
  end

  it 'plane should not be able to land at airport if full' do
    subject.capacity.times { subject.land(Plane.new, weather_fine) }

    expect { subject.land(plane, weather_fine) }.to raise_error("Can't land, airport full")
    expect(subject.parked.include?(plane)).to eq false
  end

  it 'airport capacity should default to 10, and can be overriden' do
    airport = Airport.new(20)

    expect(subject.capacity).to eq 10
    expect(airport.capacity).to eq 20
  end

  it 'plane should not be able to take off if weather is stormy' do
    plane.flying = true
    subject.land(plane, weather_fine)

    expect { subject.takeoff(plane, weather_stormy) }.to raise_error("Can't take off, too stormy")
  end

  it 'plane should not be able to land if weather is stormy' do
    plane.flying = true

    expect { subject.land(plane, weather_stormy) }.to raise_error("Can't land, too stormy")
  end

  # Edge cases
  it 'planes should only be able to take off from airports they are in' do
    plane.flying = false

    expect { subject.takeoff(plane, weather_fine) }.to raise_error("Can't take off - The plane is not at this airport")
    expect { Airport.new.takeoff(plane, weather_fine) }.to raise_error("Can't take off - The plane is not at this airport")
  end

  it 'planes that are flying shoud not be able to take off' do
    plane.flying = true

    expect { subject.takeoff(plane, weather_fine) }.to raise_error("Can't take off - The plane is already flying")
  end

  it 'planes that are flying shoud not be in airports' do
    plane.flying = true
    subject.land(plane, weather_fine)
    subject.takeoff(plane, weather_fine)

    expect(subject.parked.include?(plane)).to eq false
  end

  it 'planes that are grounded should not be able to land' do
    plane.flying = false

    expect { subject.land(plane, weather_fine) }.to raise_error("Can't land - The plane is already grounded")
  end

end
