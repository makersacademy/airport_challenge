require 'weather'

describe Weather do
  let(:weather) {double :weather, stormy?: true}

  describe '#stormy?' do
    it {is_expected.to respond_to :stormy?}

    it 'test random_outlook' do
      allow(subject).to receive(:random_outlook) {:stormy}
      expect(subject.stormy?).to eq true
    end


  end


end
