require 'weather'

describe Weather do

  describe "#generate_weather" do

    it 'generates 75% sunny & 25% stormy weather' do
      r = 1+rand(100)
      if (1..75).include? r
        expect(subject.generate_weather).to eq("Sunny")
      else
        expect(subject.generate_weather).to eq("Stormy")
      end
    end

  end
  
end
