require 'airport'
require 'plane'
require 'spec_helper'
require 'weather'
 
describe Airport do
  describe '#land' do
    it 'lands a plane' do 
       expect((Airport.new).land(Plane.new)).to eq 1
    end 

    it 'raises error when airport full' do
      10.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new) }.to raise_error 'no space here sorry'
    end

    it 'raises error when plane has already landed' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      allow(plane).to receive(:landed?).and_return(true)
      expect {airport.land(plane)}.to raise_error "Plane already landed"
  end
#   it 'does not allow landing in storm' do
#     plane = Plane.new
#     airport = Airport.new
#     allow(@weather).to receive(:stormy?).and_return true
#     expect { airport.land(plane) }.to raise_error 'no landing in stormy weather'
#   end
end
  it 'removes plane from landed_planes when it takes off' do 
    subject.land(Plane.new)
    expect(subject.take_off(Plane.new)).to eq 0
  end 
end
 
