require 'plane'
require 'control_tower'

describe PLANE do

    it 'LOGS AIRLINE NAME UPON PLANE CONSTRUCTION' do
    plane=PLANE.new
    expect(plane.airline).to eq 'virgin'
  end

    it 'LOG UNIQUE AIRLINE NAME UPON PLANE CREATION' do
    plane=PLANE.new('BA')
    expect(plane.airline).to eq 'BA'
  end

    it 'CHECK IF PLANE IS ALREADY AIRBORNE' do
    plane=PLANE.new
    expect(plane.flying).to eq true
  end

    it 'CHECK IF PLANE HAS ALREADY LANDED' do
    destination=CONTROL_TOWER.new
    name=destination.airport
    plane=PLANE.new
    expect(plane.landed(name)).to eq false
  end

    it 'CHECK IF PLANE HAS TAKEN OFF' do
    destination=CONTROL_TOWER.new
    name=destination.airport
    plane=PLANE.new
    expect(plane.take_off(name)).to eq true
  end

end
