require 'weather'

describe Weather do

  describe 'Normally the weather is sunny' do
    let(:subject) { double ":sunny?", sunny?: true }

    it '#sunny? to equal true' do
      expect(subject.sunny?).to eq true
    end
  end

  describe 'Occasionally the weathr is not sunny' do
    let(:subject) { double ":sunny?", sunny?: false }

    it '#sunny to equal false' do
      expect(subject.sunny?).to eq false
    end
  end
end
