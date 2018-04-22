require 'plane'

describe Plane do
  it 'responds to status method' do
    expect(subject).to respond_to(:flying?)
  end

  describe '#flying?', :flying? do
    it 'returns true' do
      expect(subject.flying?).to eq true
    end
  end

  describe '#take_flight' do
    it 'sets flying status to true' do
      subject.take_flight
      expect(subject.flying?).to eq true
    end
  end

  describe '#ground' do
    it 'sets flying status to false' do
      subject.ground
      expect(subject.flying?).to eq false
    end
  end
end
