require 'climate'

describe Climate do
  alias_method :climate, :subject

  describe '#conditions' do
    it 'randomly samples @possible_conditions' do
      srand(1)
      expect(climate.conditions).to eq :sunny
      expect(climate.conditions).to eq :stormy
      expect(climate.conditions).to eq :sunny
      expect(climate.conditions).to eq :sunny
    end
  end

  describe '#possible_conditions' do
    it 'includes :sunny' do
      expect(climate.possible_conditions).to include :sunny
    end
    it 'includes :stormy' do
      expect(climate.possible_conditions).to include :stormy
    end
  end

end
