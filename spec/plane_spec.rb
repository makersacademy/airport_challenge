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

  it 'landed' do
   airport=CONTROL_TOWER.new
   plane=PLANE.new
   expect(plane.land(airport)).to eq 'yes'
 end

end
