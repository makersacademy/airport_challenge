require 'weather'

describe Weather do
  let(:weather) {double :weather, stormy?: true}

  describe '#stormy?' do
    it {is_expected.to respond_to :stormy?}

    it 'test random_outlook' do
      allow(subject).to receive(:random_outlook) {:stormy}
      expect(subject.random_outlook).to eq :stormy
    end

    it 'should tell that the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq true
      #appears as not covered if it is tested before a take off method is
      #tested : ((((
    end

  end


end
