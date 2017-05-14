require 'airport'

describe Airport do

  it { is_expected.to respond_to(:lands_plane).with(1).argument }

  it { is_expected.to respond_to(:launches_plane).with(1).argument }

  it { is_expected.to respond_to(:generate_weather) }

  it { is_expected.to respond_to(:weather) }

  it { is_expected.to respond_to(:full?) }

  it { is_expected.to respond_to(:capacity) }

  describe '#lands_plane' do
    it 'gives the user a message when a plane lands' do
      plane = Plane.new
      expect(subject.lands_plane(plane)).to eq "The plane has landed!"
    end

    it 'will show a new message when trying to land a plane in stormy weather' do
      airport = Airport.new
      plane = Plane.new
      airport.instance_variable_set(:@weather, "stormy")
      expect(airport.lands_plane(plane)).to eq "Plane could not land due to stormy weather."
    end

  end

  describe '#launches_plane' do
    it 'gives the user a message when a plane takes off' do
      plane = Plane.new
      expect(subject.launches_plane(plane)).to eq "The plane has taken off!"
    end

    it 'will show a new message when trying to launch a plane in stormy weather' do
      airport = Airport.new
      plane = Plane.new
      airport.instance_variable_set(:@weather, "stormy")
      expect(airport.launches_plane(plane)).to eq "Plane could not take off due to stormy weather."
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

    it 'has a default value of sunny' do
      expect(subject.weather).to eq 'sunny'
    end
  end

  describe '#full?' do
    it 'responds with false when there are no planes in the airport' do
      expect(subject.full?).to eq false
    end
  end

end
