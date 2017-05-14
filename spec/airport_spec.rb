require 'airport'

describe Airport do

  it { is_expected.to respond_to(:lands_plane).with(1).argument }

  it { is_expected.to respond_to(:launches_plane).with(1).argument }

  it { is_expected.to respond_to(:generate_weather) }

  it { is_expected.to respond_to(:weather) }

  describe '#lands_plane' do

    it 'gives the user a message when a plane lands' do
      plane = Plane.new
      expect(subject.lands_plane(plane)).to eq "The plane has landed!"
    end

    it 'will show an error when trying to land a plane in stormy weather' do

    end

  end

  describe '#launches_plane' do
    it 'gives the user a message when a plane takes off' do
      plane = Plane.new
      expect(subject.launches_plane(plane)).to eq "The plane has taken off!"
    end
  end

  describe '#generate_weather' do

    it 'has a 90% chance to give sunny conditions' do
      airport = double(:airport, generate_weather: 'sunny')
      expect(airport.generate_weather).to eq 'sunny'
    end

    it 'has a 10% chance to give stormy conditions' do
      airport = double(:airport, generate_weather: 'stormy')
      expect(airport.generate_weather).to eq 'stormy'
    end

    it 'stores the weather conditon in @weather' do
      subject.generate_weather
      expect(subject.weather).not_to be_nil
    end
  end

end
