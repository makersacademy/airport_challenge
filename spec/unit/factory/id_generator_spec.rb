require 'factory/aeroplane_factory'
require 'factory/id_generator'

describe 'id generator' do
  describe '#generateId' do
    it 'generates a random 4 letter alphabetical Id by default' do
      result = AeroplaneFactory.generate_id
      expect(result).to match(/[A-Z]/)
      expect(result.length).to eq 4
    end

    it 'generates a random alphabetical Id with custom length' do
      result = AeroplaneFactory.generate_id(2)
      expect(result).to match(/[A-Z]/)
      expect(result.length).to eq 2
    end
  end
end
