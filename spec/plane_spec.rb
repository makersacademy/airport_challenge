require 'plane'

describe Plane do
  describe '#airborne?' do
    it 'checks if the plane is airborne' do
      expect(subject).not_to be_airborne
    end
  end

  describe '#land' do
    it 'checks if the plane is on land' do
      subject.on_land
      expect(subject.airborne?).to be false
    end
  end

  describe '#take_off' do
    it 'checks if the plane has taken off' do
      subject.in_air
      expect(subject.airborne?).to be true
    end
  end

  describe '#status' do
    it 'gives the status of the plane when airborne' do
      subject.in_air
      expect(subject.status).to eq 'The plane is in the air'
    end

    it 'gives the status of the plane when on land' do
      subject.on_land
      expect(subject.status).to eq 'The plane is on land'
    end
  end
end
