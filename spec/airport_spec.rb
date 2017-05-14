require 'airport'

describe Airport do

  it { is_expected.to respond_to(:lands_plane).with(1).argument }

  it { is_expected.to respond_to(:launches_plane).with(1).argument }

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
    it 'has a 90% chance to give sunny conditions, and a 10% chance of a storm' do
      expect(subject.show_weather).to eq "The weather is sunny!"
      expect(subject.show_weather).to eq "There's a storm!"
    end
  end
end
