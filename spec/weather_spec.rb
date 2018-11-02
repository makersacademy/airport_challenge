require 'weather'

describe Weather do

  describe '#what_is_weather' do

    it 'always has either sunny or stormy in 1000 new weather patterns' do
      1000.times { expect(subject.what_is_weather).to match(/sunny|stormy/) }
    end
    
  end

end
