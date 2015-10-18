require 'plane'

describe Plane do
let(:airport1) {double(:airport1, airport_name: "London Heathrow")}
  describe '#fly' do
    it { is_expected.to_not be_flying }
    it 'should be able to fly' do
      expect(subject.takeoff).to eq true
    end
    it 'should raise an error when attempting to takeoff when already flying' do
      subject.takeoff
      expect{subject.takeoff}.to raise_error "Already flying!"
    end
  end

  describe '#land' do
    it 'should be able to land' do
      subject.takeoff
      expect(subject.land).to eq false
    end
    it 'should raise an error when attempting to land when already on the ground' do
      expect{subject.land}.to raise_error "Already on the ground!"
    end
  end

  describe '#update_location' do
    it 'correctly updates the updated location' do
      subject.update_location("My House")
      expect(subject.location).to eq "My House"
    end
  end
end