require 'weather'

describe Weather do

  context 'That both types work' do
    it 'can be stormy' do
      array = []
      300.times{array << subject.stormy?}
      expect(array.include?(true)).to be true
    end

    it 'can be not stormy' do
      array = []
      300.times{array << subject.stormy?}
      expect(array.include?(nil)).to be true
    end
  end

end
