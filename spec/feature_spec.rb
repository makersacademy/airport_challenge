require_relative '../lib/airport.rb'

describe 'planes at the airport' do

    let(:luton) { Airport.new(2) }
    let(:jfk) {Airport.new(2)}
    let(:red_plane) {Plane.new}
    let(:blue_plane) {Plane.new}
    let(:green_plane) {Plane.new}

it 'Airport gets full' do
      luton.land(red_plane)
      luton.land(blue_plane)
      expect{luton.land green_plane}.to raise_error 'Airport Full'
end

   it 'Plane cannot take off from an airport it is not in' do
     luton.land(red_plane)
     expect{jfk.take_off red_plane}.to raise_error 'this plane is not at this airport!'
   end
 end
