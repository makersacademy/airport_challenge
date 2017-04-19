require 'weather'

describe Weather do

  describe '#initialize' do
    it 'should set "sunny" to true' do
      expect(subject.sunny).to eq true
    end

    it 'should set "stormy" to false' do
      expect(subject.stormy).to eq false
    end
  end

  describe '#sunny' do

    it 'should set sunny to true' do
      expect(subject.sunny?).to eq true
    end
  end

  describe '#stormy' do
    it 'should set stormy to true' do
      expect(subject.stormy?).to eq true
    end
  end

end
