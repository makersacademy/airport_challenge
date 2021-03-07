require 'airport'

describe Airport do

  it { is_expected. to respond_to(:land).with(1).argument }

  it { is_expected. to respond_to(:take_off).with(1).argument }

  it 'raises an error if plane has already taken off' do
    plane = Plane.new
    allow(subject).to receive(:weather) { "Sunny" }
    expect { subject.take_off(plane) }.to raise_error("Plane has already taken off")
  end

  it 'raises an error if airport is full' do
    plane = Plane.new
    allow(subject).to receive(:weather) { "Sunny" }
    subject.land(plane)
    plane2 = Plane.new
    allow(subject).to receive(:weather) { "Sunny" }
    subject.land(plane2)
    plane3 = Plane.new
    allow(subject).to receive(:weather) { "Sunny" }
    expect { subject.land(plane3) }.to raise_error("Airport full; unable to land plane")
  end

  it 'raises an error if plane has already landed' do
    plane = Plane.new
    allow(subject).to receive(:weather) { "Sunny" }
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("Plane has already landed at this airport")
  end

  it 'confirms plane has taken off' do
    plane = Plane.new
    allow(subject).to receive(:weather) { "Sunny" }
    subject.land(plane)
    expect(subject.take_off(plane)). to eq("#{plane} has taken off")
  end

  it 'is expected to have a default airport capacity of 2' do
    airport = Airport.new
    expect(airport).to have_attributes(:capacity => 2)
  end

  it 'is expected to be able to adjust airport capacity as appropriate' do
    airport = Airport.new(5)
    expect(airport).to have_attributes(:capacity => 5)
    airport = Airport.new(10)
    expect(airport).to have_attributes(:capacity => 10)
    airport = Airport.new(25)
    expect(airport).to have_attributes(:capacity => 25)
  end

  it 'expects the airport to receive sunny weather' do
    allow(subject).to receive(:weather) { "Sunny" }
  end

  it 'expects the airport to receive stormy weather' do
    allow(subject).to receive(:weather) { "Stormy" }
  end

  it 'expects planes to be prevented from taking off in stormy weather' do
    plane = Plane.new
    allow(subject).to receive(:weather) { "Sunny" }
    subject.land(plane)
    allow(subject).to receive(:weather) { "Stormy" }
    expect(subject.take_off(plane)).to eq("Weather is stormy; plane is unable to take off")
  end

  it 'expects planes to be prevented from landing in stormy weather' do
    plane = Plane.new
    allow(subject).to receive(:weather) { "Stormy" }
    expect(subject.land(plane)).to eq("Weather is stormy; plane is currently unable to land")
  end

end
