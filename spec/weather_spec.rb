require 'weather'

describe Weather do
  it { is_expected.to respond_to :forecast }

  describe 'forecast' do
    it 'can be sunny' do
      expect(subject.forecast).to eq('sunny')
    end
  end
end
