describe Weather do
  describe '#rand_number' do
    it 'every new instance of Weather should instantiate a rand_number' do
      expect([1,2,3,4,5,6,7,8,9,10]).to include subject.rand_number
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }

    it 'should be stormy when a random number is over 8 out of 10' do
      subject.stub(:rand_number).and_return(9)
      expect(subject.stormy?).to eq true
    end

    it 'should not be stormy when a random number is under 8 out of 10' do
      subject.stub(:rand_number).and_return(7)
      expect(subject.stormy?).to eq false
    end
  end
end
