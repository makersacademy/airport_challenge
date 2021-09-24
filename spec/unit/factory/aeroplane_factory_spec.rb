require 'factory/aeroplane_factory'
require 'domain/aeroplane'

describe AeroplaneFactory do

  describe "#build" do
    it 'builds a plane with a unique id, a default name and default capacity' do
      result = AeroplaneFactory.build
      expect(result.class).to eq Aeroplane
      expect(result.id).to match(/[A-Z]/)
      expect(result.passenger_capacity).to eq 100
    end

    it 'builds a plane with a unique id, a set name and default capacity' do
      plane_name = "my plane"
      result = AeroplaneFactory.build_with_name(plane_name)
      expect(result.class).to eq Aeroplane
      expect(result.id).to match(/[A-Z]/)
      expect(result.passenger_capacity).to eq 100
      expect(result.name).to eq plane_name
    end

    it 'builds a plane with a unique id, a default name and set capacity' do
      result = AeroplaneFactory.build_with_capacity(1000)
      expect(result.class).to eq Aeroplane
      expect(result.id).to match(/[A-Z]/)
      expect(result.passenger_capacity).to eq 1000
    end

    it 'builds a plane with a unique id, a set name and set capacity' do
      plane_name = "my plane"
      result = AeroplaneFactory.build_with_name_and_capacity("my plane", 1000)
      expect(result.class).to eq Aeroplane
      expect(result.id).to match(/[A-Z]/)
      expect(result.passenger_capacity).to eq 1000
      expect(result.name).to eq plane_name
    end
  end
end
