require 'airport'

describe Airport do
  let(:subject) {Airport.new(dummy_weather)}

  let(:dummy_plane) {double :plane, land: nil, takeoff: nil}
  let(:dummy_weather) {double :weather, current_weather: :sunny}

  let(:bad_weather) {'Denied. Stormy weather.'}
  let(:full_airport) {'Denied. Full airport.'}


  describe 'landing sequence:' do

    it 'can check weather on landing request' do
      expect(dummy_weather).to receive :current_weather
      subject.land_airplane dummy_plane
    end

    it 'can communicate sucessful landing to planes' do
      expect(dummy_plane).to receive :land
      subject.land_airplane dummy_plane
    end

    it 'can store landed airplanes' do
      subject.land_airplane dummy_plane
      expect(subject.list_airplanes).to eq [dummy_plane]
    end

    it 'raises an exception when a plane tries to land in stormy weather' do
      allow(dummy_weather).to receive(:current_weather).and_return :stormy
      expect{subject.land_airplane(dummy_plane)}.to raise_error bad_weather
    end

    it 'raises an exception when a plane tries to land in a full airport' do
      expect{20.times {subject.land_airplane(dummy_plane)}}.not_to raise_error
      expect{subject.land_airplane(dummy_plane)}.to raise_error full_airport
    end

  end

  describe 'takeoff sequence:' do

    it 'can check weather on takeoff request' do
      subject.land_airplane dummy_plane
      expect(dummy_weather).to receive :current_weather
      subject.launch_airplane dummy_plane
    end

    it 'can remove from storage departing planes' do
      subject.land_airplane dummy_plane
      subject.launch_airplane dummy_plane
      expect(subject.list_airplanes).to eq []
    end

    it 'can set planes to airborne' do
      subject.land_airplane dummy_plane
      expect(dummy_plane).to receive :takeoff
      subject.launch_airplane dummy_plane
    end

    it 'raises exception when a plane tries to take off in stormy weather' do
      subject.land_airplane dummy_plane
      allow(dummy_weather).to receive(:current_weather).and_return :stormy
      expect{ subject.launch_airplane(dummy_plane) }.to raise_error bad_weather
    end

  end

  describe 'storage and status:' do

    it 'can list landed airplanes' do
      expect(subject.list_airplanes).to eq []
    end

    it 'can accept a custom capacity and enforce it' do
      subject = Airport.new dummy_weather, 5
      expect{5.times {subject.land_airplane(dummy_plane)}}.not_to raise_error
      expect{subject.land_airplane(dummy_plane)}.to raise_error full_airport
    end

    it 'can wait for any new weather condition' do
      expect(dummy_weather).to receive(:change_weather).with nil
      subject.wait_for_weather
    end

    it 'can wait for a specific weather condition' do
      expect(dummy_weather).to receive(:change_weather).with :dummy_condition
      subject.wait_for_weather(:dummy_condition)
    end
  end

end
