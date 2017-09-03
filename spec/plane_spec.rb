require 'plane'
require 'control_tower'

describe PLANE do

    it 'logs airline name upon landing request to control tower' do
    plane=PLANE.new#('virgin')
    expect(plane.airline).to eq 'virgin'
  end

    it 'log unique airline name upon landing request to control tower' do
    plane=PLANE.new('BA')
    expect(plane.airline).to eq 'BA'
  end

    it 'find out if plane is currently flying' do
    plane=PLANE.new
    expect(plane.flying).to eq true
  end

    it 'check plane has landed' do
    destination=CONTROL_TOWER.new
    name=destination.airport
    plane=PLANE.new
    expect(plane.landed(name)).to eq false
 end

    it 'check plane has taken off' do
    destination=CONTROL_TOWER.new
    name=destination.airport
    plane=PLANE.new
    expect(plane.take_off(name)).to eq true
end

end
