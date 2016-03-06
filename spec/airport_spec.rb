require 'airport'

describe Airport do

  # doubles
  subject(:airport) { described_class.new }
  let(:landed) { double(:aircraft, landed: true, change_status: nil) }
  let(:airbourne) { double(:aircraft, landed: false, change_status: nil) }
  let(:sunny) { double(:weather, stormy: false) }
  let(:storm) { double(:weather, stormy: true) }

  # unit tests
  describe '#initialize' do
    it 'creates an airport with an empty dock' do
      expect(subject.dock).to eq []
    end
    it 'creates an airport with a default capacity of 5' do
      expect(subject.capacity).to eq 5
    end
    it 'allows to amend the default capacity when given a number' do
      random_capacity = Random.rand(100)
      subject = described_class.new(random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe '#landing' do
    it 'does not allow landing of aircrafts already on ground' do
      message = 'The aircraft is already on the ground'
      expect{subject.land(landed)}.to raise_error message
    end
    it 'does not allow landing if the airport is full' do
      subject.capacity.times { subject.dock << airbourne }
      message = 'Unable to instruct landing as the airport dock is full'
      expect{ subject.land(airbourne) }.to raise_error message
    end
    it 'does not allow landing if the weather is stormy' do
      message = 'Unable to instruct landing due to severe weather'
      expect{subject.land(airbourne, storm)}.to raise_error message
    end
    it 'calls change_status method on the aircraft to instruct landing' do
      expect(airbourne).to receive(:change_status)
      subject.land airbourne, sunny
    end
    it 'accepts landed aircrafts into the dock' do
      subject.land airbourne, sunny
      expect(subject.dock.include?(airbourne)).to eq true
    end
    it 'confirms landing' do
      expect(subject.land(airbourne, sunny)).to eq(
      'The aircraft has landed safely to the airport')
    end
  end

  describe '#takeoff' do
    it 'does not allow takeoff of aircrafts not docked in the airport' do
      message = 'Unable to locate the aircraft'
      expect{subject.takeoff(landed)}.to raise_error message
    end
    it 'does not allow takeoff if the weather is stormy' do
      subject.land airbourne, sunny
      message = 'Unable to instruct landing due to severe weather'
      expect{subject.takeoff(airbourne,storm)}.to raise_error message
    end
    it 'calls change_status method on the aircraft to instruct takeoff' do
      subject.land airbourne, sunny
      expect(airbourne).to receive(:change_status)
      subject.takeoff airbourne, sunny
    end
    it 'clears the aircraft from the dock' do
      subject.land airbourne, sunny
      subject.takeoff airbourne, sunny
      expect(subject.dock.include?(airbourne)).to eq false
    end
    it 'confirms takeoff' do
      subject.land airbourne, sunny
      expect(subject.takeoff(airbourne, sunny)).to eq(
      'The aircraft has successfully taken off from the airport')
    end
  end
end
