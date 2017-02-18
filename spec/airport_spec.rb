require 'airport'
include DefaultCapacity

describe Airport do

  describe '#land_plane' do
    it 'confirms plane has landed' do
      # plane = Plane.new false
      # expect(subject.land_plane(plane)).to eq [plane]
      #plane = Plane.new false
      plane = subject.land_plane
      expect(subject.land_plane).to eq plane
    end
  end

  describe '#confirm_landed?' do
    it 'confirms the correct plane has landed at airport' do
      plane = Plane.new
      subject.land_plane
      expect(subject.confirm_landed?).to eq true
    end
  end

  describe '#land_plane' do
    it 'raises an error when trying to land when airport is full' do
      DefaultCapacity::MEDIUM.times { subject.land_plane }
      expect { subject.land_plane }.to raise_error 'Airport full'
    end
  end

  describe '#take_off', :focus => true do
    it 'confirm plane takes off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq [plane]
    end
  end

  describe '#plane_left_airport?' do
    it 'confirms the correct plane left airport' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.plane_left_airport?).to eq true
    end
  end

  describe '#take_off', :focus_stormy => true do
    it 'raises an error when trying to take off in stormy weather' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off }.to raise_error 'Stormy weather preventing take-off'
    end
  end

  describe 'weather_generator', :focus_weather => true do
    it 'random weather generates a stormy weather condition' do
      allow(subject).to receive(:weather_generator).and_return(3)
      expect(subject.weather_generator).to eq 3
    end
  end
end
