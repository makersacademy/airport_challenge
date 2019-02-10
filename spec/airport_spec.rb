require 'airport'

describe Airport do

  describe 'landing planes' do
    it 'instructs a plane to land at the airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'holds a plane in the airport when it lands' do
      new_plane = double('plane')
      subject.land(new_plane)
      expect(subject.planes_landed).to include(new_plane)
    end
  end

  describe 'taking off planes' do
    it 'instructs a plane to take off from the airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'removes plane from airport once instructed to take off (assuming good weather)' do
      new_plane = double('plane')
      subject.land(new_plane)
      #weather = double('weather')
      #weather = instance_double('weather')
      #@weather.stub(:current_weather).and_return('sunny')
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      subject.take_off(new_plane)
      #allow(weather).to receive(:weather_now).and_return 'sunny'
      expect(subject.planes_landed).not_to include(new_plane)
    end
  end

  describe 'safe take off and landing during bad weather' do

    it 'prevents planes taking off when weather is stormy' do
      new_plane = double('plane')
      subject.land(new_plane)
      #weather = double('weather')
      #weather = instance_double('weather')
      #allow(weather).to return('stormy')
      #allow(weather).to receive(:current_weather).and_return 'stormy'
      #@weather.stub(:current_weather).and_return('stormy')
      #allow(weather).to receive(:current_weather).and_return('stormy')
      allow(subject.weather).to receive(:stormy_currently?).and_return true
      #expect(subject.weather.stormy_currently?).to eq(true)
      #subject.instance_variable_set(:@weather, 'stormy')
      #subject.take_off(new_plane)
      expect { subject.take_off(new_plane) }.to raise_error 'cannot take off when stormy'
      #subject.take_off(new_plane)

    end
  end

  # add tests to test edge cases:
  # - cannot take off planes if none there
  # - change how planes check status (do through airport, not plane)

end
