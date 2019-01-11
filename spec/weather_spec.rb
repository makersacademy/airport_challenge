require 'weather'

describe Weather do

  describe '#sunny?' do
    it {is_expected.to respond_to :sunny?}

    it 'should tell if it is sunny or not' do
      rand = double(4)
      allow(subject).to receive(:sunny?) {false}
    end
  end

end
