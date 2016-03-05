require 'airport'

describe Airport do
  let(:dummy_plane) {double :plane, land: nil, takeoff: nil}
  let(:dummy_weather) {double :weather, current_weather: :sunny}

  describe 'storage:' do

    it 'can list landed airplanes' do
      expect(subject.list_airplanes).to eq []
    end

  end

  describe 'landing sequence:' do

    it 'can accept landing airplanes' do
      expect(subject).to respond_to(:land_airplane).with(2).argument
    end

    it 'can store landed airplanes' do
      subject.land_airplane(probe = dummy_plane, dummy_weather)
      expect(subject.list_airplanes).to eq [probe]
    end

    it 'can set planes to landed' do
      expect(dummy_plane).to receive(:land)
      subject.land_airplane(dummy_plane, dummy_weather)
    end

    it 'can check weather on landing request' do
      expect(dummy_weather).to receive(:current_weather)
      subject.land_airplane(dummy_plane, dummy_weather)
    end

    it 'raises exception when a plane tries to land in stormy weather' do
      allow(dummy_weather).to receive(:current_weather).and_return(:stormy)
      expect {subject.land_airplane(dummy_plane, dummy_weather)}.to raise_error 'Denied. Weather is Stormy' 
    end

  end

  describe 'takeoff sequence:' do

    it 'can release departing airplanes' do
      expect(subject).to respond_to(:launch_airplane).with(1).argument
    end

    it 'can remove from storage departing planes' do
      subject.land_airplane(probe = dummy_plane, dummy_weather)
      subject.launch_airplane(probe)
      expect(subject.list_airplanes).to eq []
    end

    it 'can set planes to airborne' do
      subject.land_airplane(dummy_plane, dummy_weather)
      expect(dummy_plane).to receive(:takeoff)
      subject.launch_airplane(dummy_plane, dummy_weather)
    end


  end



end
