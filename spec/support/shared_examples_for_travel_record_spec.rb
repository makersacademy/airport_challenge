require 'travel_record'

shared_examples_for TravelRecord do
  it 'has default capacity when initialized' do
    expect(subject.capacity).to eq TravelRecord::DEFAULT_CAPACITY
  end
  describe 'capacity' do
    it 'it can be overwritten on initialisation' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end
  # elements replaces planes and location
  describe '#land' do
    it 'records a landing' do
      subject.land double(:element)
      expect(subject).not_to be_empty
    end
    it 'raises error when full' do
      subject.capacity.times {subject.land double(:element)}
      expect {subject.land double(:element)}.to raise_error "#{described_class} full"
    end
  end
  describe '#take_off' do
    it 'records a take_off' do
      subject.land double(:element)
      subject.take_off double(:element)
      expect(subject).to be_empty
    end
    it 'raises error when element not present' do
      expect {subject.take_off double(:elelment)}.to raise_error "Not at #{described_class}"
    end
  end

end