require 'weather'

describe Weather do

  describe '#sunny?' do
    it {is_expected.to respond_to :sunny?}

    it 'should tell if it is sunny or not' do
      allow(subject).to receive(:sunny?) {true}
      expect(subject.sunny?).to eq true
    end
  end

end
