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

  it 'has a working weather system' do
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
    subject.take_off
    subject.stormy = true
    expect(subject.land(airport1)).to eq 'Traffic control WTF do we do it is MAJORLY STORMY'
    expect(subject.landed).to eq false
  end

  it 'cannot land if already landed' do
    subject.landed = true
    expect{subject.land(airport1)}.to raise_error 'Are you crazy, sir? This plane is already on the ground!'
end

  it 'cannot take off if already in the air' do
    subject.landed = false
    expect{subject.take_off}.to raise_error 'Are you crazy, sir? This plane is already in the air!'
  end

end
