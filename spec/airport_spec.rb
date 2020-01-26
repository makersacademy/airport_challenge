require 'airport'
require 'plane'
require 'spec_helper'
require 'weather'
 
describe Airport do

  it 'lands a plane' do 
     expect((Airport.new).land(Plane.new)).to eq 1
  end 

  it 'raises error when airport full' do
    10.times { subject.land(Plane.new) }
    expect{ subject.land(Plane.new) }.to raise_error 'no space here sorry'
  end

#   it 'does not allow landing in storm' do
#     allow(Weather.new).to receive(:stormy?).and_return true
#     expect { subject.land(Plane.new) }.to raise_error 'no landing in stormy weather'
#   end

  it 'removes plane from landed_planes when it takes off' do 
    subject.land(Plane.new)
    expect(subject.take_off(Plane.new)).to eq 0
  end 
end
 
