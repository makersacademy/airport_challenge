require 'planes'

describe Plane do
  it 'should have a default status of :flying' do
    expect(subject.status).to eq(:flying)
  end

  describe '#land' do
    it 'should set status to :landed' do
      subject.land
      expect(subject.status).to eq(:landed)
    end
  end

  describe '#fly' do
    it 'should set status to :flying' do
      subject.land
      subject.fly
      expect(subject.status). to eq(:flying)
    end
  end
end
