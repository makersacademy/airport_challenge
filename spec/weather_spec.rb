require 'weather'

describe Weather do

  describe 'forecast' do
    it { is_expected.to respond_to :forecast }

    it "should randomly return 'Clear' or 'Stormy'" do
      expect(subject.forecast).to eq('Clear').or eq('Stormy')
    end
  end
end
