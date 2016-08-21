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

  describe '#is_sunny' do

    it 'should set sunny to true' do
      expect(subject.is_sunny).to eq true
    end
  end

  describe '#is_stormy' do
    it 'should set stormy to true' do
      expect(subject.is_stormy).to eq true
    end
  end

  describe '#random_weather' do
    it 'should set weather to stormy randomly less than 10% of the time' do
      10.times { subject.random_weather }
      expect(subject.stormy).to eq true
    end
  end


end
