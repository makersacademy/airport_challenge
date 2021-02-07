require 'weather'

class AirportDbl
  include Weather
end

class Stormy
  def self.rand
    0.9
  end
end

class Clear
  def self.rand
    0.1
  end
end

describe Weather do
  describe 'weather report' do
    before(:each) do
      @airport_dbl = AirportDbl.new
    end
    it 'returns weather forecast of :clear' do
      expect(@airport_dbl.report(Clear)).to eq :clear
    end
    it 'returns weather forecast of :stormy' do
      expect(@airport_dbl.report(Stormy)).to eq :stormy
    end
  end
end
