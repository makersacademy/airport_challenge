require 'factory/airport_factory'
require 'domain/airport'
require 'services/weather_service'

describe AirportFactory do

  describe "#build" do
    it 'builds a airport with a unique id, code, default name and default capacity' do
      result = AirportFactory.build
      expect(result.class).to eq Airport
      expect(result.code).to match(/[A-Z]/)
    end

    it 'builds a airport with custom options' do
      name = "test"
      code = "ABC"
      capacity = 5
      result = AirportFactory.build_with_options(name, code, capacity)
      expect(result.class).to eq Airport
      expect(result.airport_name).to eq name
      expect(result.code).to eq code
      expect(result.capacity).to eq capacity
    end
  end
end
