require 'weather'

describe Weather do

  describe '#initialize' do
    it 'assumes that weather is not stormy to start with' do
      expect(subject.stormy). to eq false
    end
  end

end
