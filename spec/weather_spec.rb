require 'weather'

describe Weather do
  alias_method :weather, :subject

  describe '#conditions' do
    it 'randomly samples @possible_climates' do
      srand(1)
      expect(weather.conditions).to eq :sunny
      expect(weather.conditions).to eq :stormy
      expect(weather.conditions).to eq :sunny
      expect(weather.conditions).to eq :sunny
    end
  end

  describe '#possible_climates' do
    it 'includes :sunny' do
      expect(weather.possible_climates).to include :sunny
    end
    it 'includes :stormy' do
      expect(weather.possible_climates).to include :stormy
    end
  end

end
