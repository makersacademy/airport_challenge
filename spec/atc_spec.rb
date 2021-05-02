require './lib/atc.rb'
# require './airport'
# require './plane'


describe ATC do
  
  # it 'instructs plane to land at an airport' do
    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it { is_expected.to respond_to(:takeoff_plane).with(1).argument }
  
    it 'confirms plane has taken off' do 
      airport = Airport.new
      expect(subject.takeoff_plane(airport)).to eq true
    end

end
  
    