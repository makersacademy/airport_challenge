require 'plane'

describe Plane do
  subject { Plane.new }

  let (:airport) { Airport.new }

  it 'responds to land method with one argument' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to take_off method with one argument' do
    expect(subject).to respond_to(:take_off)
  end

  it 'does not allow takeoff when stormy' do
    allow(airport).to receive(:rand) { 9 }
    expect{ subject.take_off(airport) }.to raise_error('DANGER: Storm Forecast')
  end

  it 'does not allow land when stormy' do
    allow(airport).to receive(:rand) { 9 }
    expect{ subject.land(airport) }.to raise_error('DANGER: Storm Forecast')
  end

end
