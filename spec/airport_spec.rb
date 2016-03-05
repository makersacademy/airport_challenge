require 'airport'

describe Airport do

  # methods to respond to
  it { is_expected.to respond_to(:capacity) }
  it { is_expected.to respond_to(:aircrafts) }
  it { is_expected.to respond_to(:landing).with(1).argument }

  # doubles
  subject(:airport) { described_class.new }
  let(:landed) { double(:aircraft, landed: true, change_status: nil) }
  let(:airbourne) { double(:aircraft, landed: false, change_status: nil) }

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
      expect{ subject.landing landed }.to raise_error 'The aircraft has already landed.'
    end

    it 'does not allow landing if the airport is full' do
      subject.capacity.times { subject.aircrafts << airbourne }
      expect{subject.landing airbourne}.to raise_error 'The airport is full.'
    end

    it 'calls aircraft.change_status method' do
      expect(airbourne).to receive(:change_status)
      subject.landing airbourne
    end

    it 'accepts landing aircrafts' do
      subject.landing airbourne
      expect(subject.aircrafts).to include airbourne
    end

    it 'confirms the landing' do
      expect(subject.landing airbourne).to eq 'The aircraft has landed safely.'
    end
  end

end
