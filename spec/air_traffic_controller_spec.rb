require 'plane'
require 'airport'

describe Airport do
  it 'Airport responds to land method with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Airport responds to take off method with one argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'Land method returns message' do
    plane = Plane.new
    expect(subject.land(plane)).to eq "#{plane} has landed"
  end

  it 'Take off method returns message with airport information' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq "#{plane} has taken off and is no longer at #{subject}"
  end

  it 'Plane added to airport class - plane array when landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq [plane]
  end

  it 'Plane removed from airport class - plane array when it has taken off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.plane).not_to include(plane)
  end

  it 'Raise error to take off plane if it has already taken off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect { subject.take_off(plane) }.to raise_error("This plane (#{plane}) has already taken off")
  end

  it 'Raise error to land plane if plane has already landed' do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("This plane (#{plane}) has already landed")
  end
end
