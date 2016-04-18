require 'weather'

describe Weather do

  describe 'stormy?' do

    it 'expects it to create stormy wheather when randomized number is bigger than 8' do
      allow(subject).to receive(:random_number).and_return(9)
      expect(subject.stormy?).to be true
    end

    it 'expects it to create good wheather when randomized number is smaller than 8' do
      allow(subject).to receive(:random_number).and_return(2)
      expect(subject.stormy?).to be false
    end

  end



end
