require 'weatherservice'

describe Weatherservice do

  context "stormy" do
    subject { Weatherservice.new Random.new 1 }
    it 'returns the weather' do
      expect(subject.weather).to eq "stormy"
    end
  end

  context "sunny" do
    subject { Weatherservice.new Random.new 2 }
    it 'returns the weather' do
      expect(subject.weather).to eq "sunny"
    end
  end

end