require 'weather'

describe Weather do
  context "#weather" do
    it 'tells us the weather is sunny' do
      expect(subject.weather).to eq "sunny"
    end
  end
end
