describe Weather do

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }

    it 'every new instance of Weather should either be stormy or not' do
      expect([true, false]).to include subject.stormy?
    end
  end

end
