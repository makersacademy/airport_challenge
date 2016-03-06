require 'airport'

describe Airport do

  # methods to which instances of the described_class respond to
  it { is_expected.to respond_to(:capacity) }
  it { is_expected.to respond_to(:dock) }
  it { is_expected.to respond_to(:land).with(2).argument }
  it { is_expected.to respond_to(:takeoff).with(2).argument }

  # doubles
  subject(:airport) { described_class.new }
  let(:landed) { double(:aircraft, landed: true, change_status: nil) }
  let(:airbourne) { double(:aircraft, landed: false, change_status: nil) }
  let(:sunny) { double(:weather, stormy: false) }
  let(:storm) { double(:weather, stormy: true) }

  # unit tests
  describe '#initialize' do
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
      expect{subject.land(landed)}.to raise_error'The aircraft is on the ground'
    end
    it 'does not allow landing if the airport is full' do
      subject.capacity.times { subject.dock << airbourne }
      expect{ subject.land(airbourne) }.to raise_error'The airport is full'
    end
    it 'does not allow landing if the weather is stormy' do
      expect{subject.land(airbourne, storm)}.to raise_error'Weather not ideal.'
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
      "The #{airbourne} has landed safely to #{subject}")
    end
  end

  describe '#takeoff' do
    it 'does not allow takeoff of aircrafts not docked in the airport' do
      expect{subject.takeoff(landed)}.to raise_error'Cannot locate the aircraft'
    end
    it 'does not allow takeoff if the weather is stormy' do
      subject.land airbourne, sunny
      expect{subject.takeoff(airbourne,storm)}.to raise_error'Weather not ideal'
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
      "The #{airbourne} has successfully taken off from #{subject}")
    end
  end
end
