require './lib/atc.rb'
# require './airport'
# require './lib/plane'


describe ATC do
  
  # it 'instructs plane to land at an airport' do
    it { is_expected.to respond_to(:land_plane).with(2).argument }

  
    it 'confirms plane has taken off' do 
      airport = Airport.new
      plane = Plane.new
      expect(subject.takeoff_plane(airport, plane)).to eq true
    end

    it 'prevent landing if airport is full' do 
      airport = Airport.new
      expect(subject.prevent_landing(airport)).to eq true
    end

end
  
    