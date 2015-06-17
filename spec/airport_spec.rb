require 'airport'


describe Airport do


  describe 'weather' do
    it 'sets sunny/stormy weather' do
      expect(subject).to respond_to :weather_check
    end
  end

  describe 'landing' do
    it 'responds to land method' do
      expect(subject).to respond_to :land
    end
  end

    it{is_expected.to respond_to(:land).with(1).argument}

  describe 'traffic control' do #why doesn't this pass?
    context 'when conditions are stormy' do
      it 'does not allow planes to land' do
        plane = double :plane
        allow(subject).to receive(:weather_check){'stormy'}
        expect(subject.land(plane)).to eq 'Stormy weather. Try later'
      end

    it 'does not allow planes to take off' do
      allow(subject).to receive(:weather_check){'stormy'}
      expect(subject.take_off(plane)).to eq 'Stormy weather. Try later'
    end
    end

  context 'when airport full' do
     it 'does not allow planes to land' do
       plane = double :plane

       10.times{subject.land plane}
       expect{subject.land plane}.to raise_error "No capacity at airport"
     end
   end
  end
end

