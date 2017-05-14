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

  describe '#gets_random_weather' do
    it 'returns a weather condition' do
      expect(subject.show_weather).to eq "The weather is sunny!"
    end
  end
end
