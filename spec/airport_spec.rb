require 'airport.rb'

  describe Airport do

  it { is_expected.to respond_to :take_off }
  it 'allows a plane to take off and expects good weather' do
    airport = Airport.new
    plane = airport.take_off
     expect(plane.good_weather?).to eq true
   end

     it { is_expected.to respond_to(:land_plane).with(1).argument }
     it { is_expected.to respond_to(:plane) }
     it 'lets a plane land (returns plane)' do
       plane = Plane.new
       subject.land_plane(plane)
       expect(plane).to eq plane
     end

end
