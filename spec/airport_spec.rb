require 'airport'

describe Airport do

  context 'taking off and landing:' do
    it { is_expected.to respond_to :land_plane }
    it 'can land a plane' do
      weather = double('Weather', weather: 'sunny')
      subject.weather(weather)
      planes = subject.num_planes
      plane = double('Plane', land: nil)
      subject.land_plane plane
      expect(subject.num_planes).to eq(planes + 1)
    end
    it { is_expected.to respond_to :takeoff_plane }
    it 'raises error when airport is empty' do
      expect { subject.takeoff_plane }.to raise_error 'cannot takeoff'
    end
    it 'can takeoff a plane' do
      weather = double('Weather', weather: 'sunny')
      subject.weather(weather)
      plane = double('Plane', land: nil, take_off: nil)
      subject.land_plane plane
      plane = subject.planes.last
      expect(subject.takeoff_plane).to eq(plane)
    end
    it 'calls a planes land method when it lands' do
      weather = double('Weather', weather: 'sunny')
      subject.weather(weather)
      plane = double('Plane')
      expect(plane).to receive(:land)
      subject.land_plane plane
    end
    it 'calls a planes take_off method when it takes off' do
      weather = double('Weather', weather: 'sunny')
      subject.weather(weather)
      plane = double('Plane', land: nil)
      subject.land_plane plane
      expect(plane).to receive(:take_off)
      subject.takeoff_plane
    end
  end

  context 'traffic control:' do
    it 'should have a capcity of 20' do
      expect(subject.capcity).to eq 20
    end
    it 'raise an error when full' do
      weather = double('Weather', weather: 'sunny')
      subject.weather(weather)
      plane = double('Plane', land: nil)
      20.times { subject.land_plane plane }
      expect { subject.land_plane plane }.to raise_error 'cannot land'
    end
    context 'weather conditions:' do
      it { is_expected.to respond_to :weather }
      it 'should return true if weather is sunny' do
        weather = double('Weather', weather: 'sunny')
        expect(subject.weather(weather)).to eq true
      end
      it 'a plane cannot take off when there is a storm brewing' do
        weather = double('Weather', weather: 'sunny')
        subject.weather(weather)
        plane = double('Plane', land: nil)
        subject.land_plane plane
        weather = double('Weather', weather: 'stormy')
        subject.weather(weather)
        expect { subject.takeoff_plane }.to raise_error 'cannot takeoff'
      end
      it 'a plane cannot land in the middle of a storm' do
        weather = double('Weather', weather: 'stormy')
        subject.weather(weather)
        expect { subject.land_plane :plane }.to raise_error 'cannot land'
      end
    end
  end
end
