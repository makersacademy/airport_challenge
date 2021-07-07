require 'plane'
describe Plane do 
  
  let(:airport) { double("airport", :planes => []) } 
  let(:airport_full) { allow(airport).to receive(:full?).and_return true }
  let(:airport_space) { allow(airport).to receive(:full?).and_return false }
  let(:clear) { allow(subject).to receive(:weather_stormy?).and_return false }
  let(:stormy) { allow(subject).to receive(:weather_stormy?).and_return true }

  describe '#land_plane' do
    it 'can land a plane and store it at an airport' do
      clear
      airport_space
      subject.land_plane(airport)
      expect(airport.planes).to include(subject)
    end 
    it 'throws an error if the airport is full' do
      clear
      airport_full
      expect { subject.land_plane(airport) }.to raise_error 'Airport is full'
    end
    it 'throws an error if the plane is already landed' do
      clear
      airport_space
      subject.land_plane(airport)
      expect { subject.land_plane(airport) }.to raise_error 'Plane already landed'
    end
    it 'throws an error if the weather is stormy' do
      stormy
      expect { subject.land_plane(airport) }.to raise_error 'It is too stormy to land'
    end
  end
  
  describe '#take_off_from' do 
    it 'removes plane from airport and confirms it is no longer at airport' do
      airport_space
      subject.land_plane(airport)
      expect(subject.take_off_from(airport)).to eq "#{subject} has taken off"
      expect(airport.planes).not_to include(subject)
    end
    it 'throws an error if airport does not contain plane' do
      airport2 = double(:airport, planes: [])
      airport_space
      subject.land_plane(airport)
      expect { subject.take_off_from(airport2) }.to raise_error 'Plane not at airport'
    end
    it 'throws an error if the plane is not landed' do 
      subject.landed = false
      expect { subject.take_off_from(airport) }.to raise_error 'Plane is not landed'
    end
    it 'throws an error if the weather is stormy' do
      airport_space
      subject.land_plane(airport)
      stormy
      expect { subject.take_off_from(airport) }.to raise_error 'It is too stormy to take off'
    end
  end
  
  describe '#weather_stormy?' do 
    it 'returns true if the weather is stormy' do
      stormy
      expect(subject.weather_stormy?).to eq true
    end
    it 'returns false if the weather is clear' do
      clear
      expect(subject.weather_stormy?).to eq false
    end
  end
end    
