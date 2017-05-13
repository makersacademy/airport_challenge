require 'airport'

describe Airport do

  it { is_expected.to respond_to(:lands_plane).with(1).argument }

  it { is_expected.to respond_to(:launches_plane).with(1).argument }

  describe '#lands_plane' do
    it 'gives the user a message when a plane lands' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.lands_plane(plane)).to eq "The plane has landed!"
    end
  end

  describe '#launches_plane' do
    it 'gives the user a message when a plane takes off' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.launches_plane(plane)).to eq "The plane has taken off!"
    end
  end
end
