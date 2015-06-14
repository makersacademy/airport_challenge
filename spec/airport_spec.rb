require 'airport'


describe Airport do

    it {is_expected.to respond_to :weather}

  describe 'weather' do
    it 'sets sunny/stormy weather' do
      expect(subject).to respond_to :weather_type
    end

    # it 'tests sunny weather' do
    #   allow(subject).to receive(:weather){7}
    #   expect(subject.weather_type).to eq "sunny"
    # end

  end

  describe 'landing' do
    it 'responds to land method' do
      expect(subject).to respond_to :land
    end

    it{is_expected.to respond_to(:land).with(1).argument}

  end

  describe 'traffic control' do
    context 'when conditions are stormy' do
      it 'does not allow planes to take off' do
      allow(subject).to receive(:weather_type){'stormy'}
      expect{subject.land Plane.new}.to raise_error 'Stormy weather. Try later'
      end
    end

    context 'when airport full' do
      it 'does not allow planes to take off' do
      20.times{subject.land Plane.new}
      expect{subject.land Plane.new}.to raise_error "No capacity at airport"
      end
    end
  end
end

  # NOT SURE HOW TO TEST FOR THIS ONE
  # describe 'take off' do
  #   it 'does not have any onground planes'
  #     @planes.length == 0
  #     exepct{xxxxx}.to raise_error "No plans to take off"

  # end

		