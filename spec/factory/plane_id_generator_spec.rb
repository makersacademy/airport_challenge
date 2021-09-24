require 'factory/aeroplane_factory'
require 'factory/plane_id_generator'

describe 'an id generator' do
  describe '#generateId' do
    it 'generates a random 4 letter alphabetical Id' do
      example_extender = AeroplaneFactory
      expect(example_extender.generate_id).to match(/[A-Z]/)
    end
  end
end
