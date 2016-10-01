require 'plane'
require 'airport'

describe Plane do

let (:airport) {Airport.new}

  it 'lands at a specified airport and announces itself' do
    subject.take_off
    expect(subject.land(airport)).to eq 'Traffic control this is niner-niner-three. We have landed!'
    expect(subject.landed).to eq true
    end

  it 'has a working random weather system' do
    subject.stub(:chance) { 8 }
    subject.weather
    expect(subject.stormy).to eq true
  end

  it 'takes off and announces itself if weather clear' do
    subject.stormy = false
    expect(subject.take_off).to eq 'Traffic control this is niner-niner-three. We have taken off!'
    expect(subject.landed).to eq false
  end

  it 'cannot land while stormy' do
    subject.stormy = true
    expect(subject.land(airport)).to eq 'Traffic control WTF do we do it is MAJORLY STORMY'
    expect(subject.landed).to eq false
  end


end
