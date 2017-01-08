require 'plane'

describe Plane do
  before(:example) do
    allow(subject).to receive(:weather) { "sunny" }
  end

  it 'should respond to method land' do
    expect(subject).to respond_to(:land)
  end

  it 'should land at an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'should respond to method take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'should take off from an airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'should respond to method confirm_landed?' do
    expect(subject).to respond_to(:confirm_landed?)
  end

  it 'should return true to confirm_landed? after landing' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.confirm_landed?).to eq(true)
  end

  it 'should not return true to confirm_landed? after take_off' do
    airport = Airport.new
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.confirm_landed?).to eq(false)
  end

  it 'should respond to method confirm_take_off?' do
    expect(subject).to respond_to(:confirm_take_off?)
  end

  it 'should return true to confirm_take_off? after take_off' do
    airport = Airport.new
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.confirm_take_off?).to eq(true)
  end

  it 'should not return true to confirm_take_off? after landing' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.confirm_take_off?).to eq(false)
  end

  it 'should not be able to land when already stored in an airport' do
    airport = Airport.new
    subject.land(airport)
    expect { subject.land(airport) }.to raise_error("Plane is already landed at #{airport}.")
  end

  it 'should not be able to takeoff if not already stored in an airport' do
    airport = Airport.new
    expect { subject.take_off(airport) }.to raise_error("Plane is not currently in #{airport} so cannot take off.")
  end

  it 'should not be able to land when weather is stormy' do
    airport = Airport.new
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.land(airport) }.to raise_error("The weather is currently stormy and it is not safe to land.")
  end

  it 'should not be able to take_off when weather is stormy' do
    airport = Airport.new
    subject.land(airport)
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.take_off(airport) }.to raise_error("The weather is currently stormy and it is not safe to depart.")
  end
end
