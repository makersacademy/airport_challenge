require 'planes'

describe Plane do
  describe 'initial status' do
    it 'should have an initial status of :flying' do
      expect(subject.status).to eq(:flying)
    end
  end

  describe '#change_status' do
    it 'should set status to :landed from :flying' do
      subject.change_status
      expect(subject.status).to eq(:landed)
    end

    it 'should set status to :flying from :landed' do
      expect(subject.status).to eq(:flying)
    end
  end

  describe '#landed?' do
    it 'should return true or false' do
      expect([true, false].include?(subject.landed?)).to eq true
    end
  end
end
