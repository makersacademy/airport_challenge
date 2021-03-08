require './lib/airport.rb'

describe Plane do
  it 'Does plane object exist' do
    plane = Plane.new
    expect(plane).to be(plane)
  end
end

describe Airport do
  it 'Does Airport allows landing' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Can plane object land' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'Can plane be instructed to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'Does Airport confirm it is no longer there, when a plane takes off' do
    allow(subject).to receive(:weather_report) { 'Clear' }
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include(plane)
    subject.take_off
    expect(subject.planes).not_to include(plane)
  end

  it 'Does Airport prevent landing when full' do
    20.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'Does Airport prevent take off when weather is stormy' do
    allow(subject).to receive(:weather_report) { 'Stormy' }
    plane = Plane.new
    subject.land(plane)
    expect { subject.safety_check }.to raise_error 'Weather is stormy'
  end
end
