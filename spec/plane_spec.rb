require 'plane'
require 'airport'

describe Plane do

let (:airport1) {Airport.new}
let (:airport2) {Airport.new}

  it 'lands at a specified airport and announces itself' do
    subject.take_off
    expect(subject.land(airport1)).to eq 'Traffic control this is niner-niner-three. We have landed!'
    expect(subject.landed).to eq true
    end

  it 'has a working random weather system' do
    subject.stub(:chance) { 8 }
    subject.weather
    expect(subject.stormy).to eq true
  end

  it 'takes off if weather clear' do
    subject.stormy = false
    expect(subject.take_off).to eq 'Traffic control this is niner-niner-three. We have taken off!'
    expect(subject.landed).to eq false
  end

  it 'announces itself when taking off' do
    expect(subject.take_off).to eq 'Traffic control this is niner-niner-three. We have taken off!'
  end



end
