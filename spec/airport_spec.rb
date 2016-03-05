require 'airport'

describe Airport do

  # methods the described_class responds to
  it { is_expected.to respond_to(:capacity) }
  it { is_expected.to respond_to(:aircrafts) }
  it { is_expected.to respond_to(:land).with(2).argument }
  it { is_expected.to respond_to(:takeoff).with(2).argument }

  # doubles
  subject(:airport) { described_class.new }
  let(:landed) { double(:aircraft, landed: true, change_status: nil) }
  let(:airbourne) { double(:aircraft, landed: false, change_status: nil) }
  let(:sunny) { double(:weather, stormy: false) }
  let(:stormy) { double(:weather, stormy: true) }

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
    it 'does not allow landing of already landed aircrafts' do
      expect{subject.land(landed)}.to raise_error'The aircraft is on the ground'
    end
    it 'does not allow landing if the airport is full' do
      subject.capacity.times { subject.aircrafts << airbourne }
      expect{ subject.land(airbourne) }.to raise_error'The airport is full'
    end
    it 'does not allow landing if the weather is stormy' do
      expect{subject.land(airbourne, stormy)}.to raise_error'Weather not ideal.'
    end
    it 'calls change_status method on the aircraft' do
      expect(airbourne).to receive(:change_status)
      subject.land airbourne, sunny
    end
    it 'accepts landing aircrafts' do
      subject.land airbourne, sunny
      expect(subject.aircrafts).to include airbourne
    end
    it 'confirms landing' do
      expect(subject.land(airbourne, sunny)).to eq(
      "The #{airbourne} has landed safely to #{subject}")
    end
  end

  describe '#takeoff' do
    it 'does not allow takeoff of aircrafts not landed in the airport' do
      expect{subject.takeoff(landed)}.to raise_error'Cannot locate the aircraft'
    end
    it 'does not allow takeoff if the weather is stormy' do
      subject.land airbourne, sunny
      expect{subject.takeoff(airbourne,stormy)}.to raise_error'Weather not ideal'
    end
    it 'calls change_status method on the aircraft' do
      subject.land airbourne, sunny
      expect(airbourne).to receive(:change_status)
      subject.takeoff airbourne, sunny
    end
    it 'clears the aircraft from the airport' do
      subject.land airbourne, sunny
      subject.takeoff airbourne, sunny
      expect(subject.aircrafts).not_to include airbourne
    end
    it 'confirms takeoff' do
      subject.land airbourne, sunny
      expect(subject.takeoff(airbourne, sunny)).to eq(
      "The #{airbourne} has successfully taken off from #{subject}")
    end
  end
end
