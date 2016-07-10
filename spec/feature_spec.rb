require_relative '../lib/airport.rb'

describe 'planes at the airport' do

    let(:luton) { Airport.new(2) }
    let(:jfk) {Airport.new(2)}
    let(:red_plane) {Plane.new}
    let(:blue_plane) {Plane.new}
    let(:green_plane) {Plane.new}

  it 'Airport gets full' do
    good_weather
        luton.land(red_plane)
        luton.land(blue_plane)
        expect{luton.land green_plane}.to raise_error 'Airport Full'
  end

   it 'Plane cannot take off from an airport it is not in' do
     good_weather
     luton.land(red_plane)
     expect{jfk.take_off red_plane}.to raise_error 'this plane is not at this airport!'
   end

   it 'plane cannot land if it is not airborne' do
     good_weather
     green_plane.down
     expect{jfk.land green_plane}.to raise_error 'That plane is not airborne, so cannot land'
   end

   it 'Bad weather prevents take off'do
     bad_weather
     expect{luton.take_off red_plane}.to raise_error 'It is too dangerous to do that right now.'
   end
   it 'Bad weather prevents landing' do
     bad_weather
     expect{jfk.land green_plane}.to raise_error 'It is too dangerous to do that right now.'
   end

  private

   def good_weather
     allow(Weather).to receive(:fair?).and_return(true)
   end

   def bad_weather
     allow(Weather).to receive(:fair?).and_return(false)
   end
end
