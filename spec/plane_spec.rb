require 'plane'
require 'airport'

describe Plane do

let (:airport1) {Airport.new}
let (:airport2) {Airport.new}

  it 'lands at a specified airport and announces itself' do
    subject.take_off
    subject.land(airport1)
    expect(subject.landed).to eq true
    end

  it 'announces itself when landing' do
    subject.take_off
    expect(subject.land(airport1)).to eq 'Traffic control this is niner-niner-three. We have landed!'
  end

  it 'has a working random weather system' do
    subject.stub(:chance) { 8 }
    subject.weather
    expect(subject.stormy).to eq true
  end

  it 'takes off if weather clear' do
    subject.stormy = true
    expect(subject.take_off).to eq 'Traffic control we are grounded. It is STORMY!'
    expect(subject.landed).to eq true
  end

  it 'announces itself when taking off' do
    expect(subject.take_off).to eq 'Traffic control this is niner-niner-three. We have taken off!'
  end

end
