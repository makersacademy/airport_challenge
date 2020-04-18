require 'air_traffic_controller'
require 'plane'

describe Plane do
  it 'plane responds to confirm_status method' do
    expect(subject).to respond_to(:confirm_status)
  end
end

describe Airport do
  it 'Airport responds to land method with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Airport responds to take off method with one argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'land method returns plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'land method to return plane that has taken off' do
    plane = subject.take_off(Plane.new)
    expect(subject.land(plane)).to eq plane
  end

  it 'Airport returns a flying plane' do
    plane = subject.take_off(Plane.new)
    expect(subject.flying_plane).to eq plane
  end

  it 'Airport returns a stationary plane' do
    plane = subject.take_off(Plane.new)
    subject.land(plane)
    expect(subject.stationary_plane).to eq plane
  end
end
