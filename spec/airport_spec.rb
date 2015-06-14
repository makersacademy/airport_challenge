require 'airport'


describe Airport do

    it {is_expected.to respond_to :weather}

  describe 'weather' do
    it 'sets sunny/stormy weather' do
      expect(subject).to respond_to :weather_type
    end

    it 'tests sunny weather' do
      allow(subject).to receive(:weather){7}
      expect(subject.weather_type).to eq "sunny"
    end

  end

  describe 'landing' do
    it 'responds to land method' do
      expect(subject).to respond_to :land
    end

    it{is_expected.to respond_to(:land).with(1).argument}
    
  end

end

			

  # describe 'take off' do
  #   xit 'instructs a plane to take off'

  #   xit 'releases a plane'
  # end

  # describe 'landing' do
  #   xit 'instructs a plane to land'

  #   xit 'receives a plane'
  # end

  # describe 'traffic control' do
  #   context 'when airport is full' do
  #     xit 'does not allow a plane to land'
  #   end

  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'

  #     xit 'does not allow a plane to land'
  #   end
  # end

