require 'factory/aeroplane_factory'
require 'aeroplane'

describe AeroplaneFactory do
  describe "#build" do
    it 'builds a plane with a unique id, a default name and default capacity' do
      result = AeroplaneFactory.build
      expect(result.class).to eq Aeroplane
    end

    it 'builds a plane with a unique id, a set name and default capacity' do
      result = AeroplaneFactory.build_with_name("my plane")
      expect(result.class).to eq Aeroplane
    end

    it 'builds a plane with a unique id, a default name and set capacity' do
      result = AeroplaneFactory.build_with_capacity(1000)
      expect(result.class).to eq Aeroplane
    end

    it 'builds a plane with a unique id, a set name and set capacity' do
      result = AeroplaneFactory.build_with_name_and_capacity("my plane", 1000)
      expect(result.class).to eq Aeroplane
    end
  end
end
