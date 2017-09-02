require './lib/airport.rb'

describe Airport do
  it {is_expected.to respond_to(:landing)}
  

  describe '#landing' do
    it 'lands plane' do
      expect(subject.lands(planes)).to eq([plane])
    end
  end
end
