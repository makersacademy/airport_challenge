require 'air_traffic_controller'
require 'plane'

describe Plane do
  it 'Plane responds to confirm_status method with one argument' do
    expect(subject).to respond_to(:confirm_status).with(1).argument
  end

  it 'confirm_status to return whether plane is flying' do
    plane = subject.take_off(Plane.new)
    expect(subject.confirm_status(plane)).to eq "plane is flying"
  end

  it 'Plane responds to land method with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Plane responds to take off method with one argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'Land method returns message' do
    plane = Plane.new
    expect(subject.land(plane)).to eq "#{plane} has landed"
  end

  it 'Confirm plane is set to stationary when it has landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.stationary).to eq true
  end

  it 'Take off method returns message' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "#{plane} has taken off"
  end

  it 'Confirm plane is set to flying when it has taken off' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.flying).to eq true
  end

  it 'Confirm stationary is false when it has taken off' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.stationary).to eq false
  end

  it 'Confirm flying is false when it has landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.flying).to eq false
  end

  it 'Raise error to take off plane if it has already taken off' do
    plane = Plane.new
    subject.take_off(plane)
    expect { subject.take_off(plane) }.to raise_error("This plane (#{plane}) has already taken off")
  end

  it 'Raise error to land plane if plane has already landed' do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("This plane (#{plane}) has already landed")
  end
end

describe Airport do
end
