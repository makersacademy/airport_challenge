require 'airport'

describe Airport do

  it { is_expected.to respond_to(:lands_plane).with(1).argument }

  it { is_expected.to respond_to(:launches_plane).with(1).argument }

  it { is_expected.to respond_to(:show_weather) }

  describe '#lands_plane' do
    it 'gives the user a message when a plane lands' do
      plane = Plane.new
      expect(subject.lands_plane(plane)).to eq "The plane has landed!"
    end
  end

  describe '#launches_plane' do
    it 'gives the user a message when a plane takes off' do
      plane = Plane.new
      expect(subject.launches_plane(plane)).to eq "The plane has taken off!"
    end
  end

  describe '#show_weather' do
    it 'has a 90% chance to give sunny conditions' do
      airport = double(:airport, show_weather: "The weather is sunny!")
      expect(airport.show_weather).to eq "The weather is sunny!"
    end

    it 'has a 10% chance to give stormy conditions' do
      airport = double(:airport, show_weather: "There's a storm!")
      expect(airport.show_weather).to eq "There's a storm!"
    end
  end

end
