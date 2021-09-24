require_relative '../domain/airport'
require_relative './id_generator'

class AirportFactory
  extend IdGenerator

  DEFAULT_CAPACITY = 20
  
  STATUS_CODES = [
    "LHR", 
    "ATL", 
    "CDG", 
    "ORD", 
    "LAX", 
    "DFW", 
    "PEK", 
    "PVG", 
    "DEN", 
    "DXB", 
  ].freeze

  NAMES = [
    "Heathrow", 
    "O'Hare International Airport", 
    "Los Angeles International Airport", 
    "Orlando International Airport", 
    "Amsterdam Airport Schiphol", 
    "Istanbul Sabiha Gökçen International Airport", 
    "Beijing Daxing International Airport", 
    "Charles de Gaulle Airport", 
    "Frankfurt Airport", 
    "Indira Gandhi International Airport", 
  ].freeze

  def self.build(weather_service)
    Airport.new(
      AirportFactory::NAMES.sample, 
      generate_id, 
      AirportFactory::STATUS_CODES.sample, 
      weather_service, 
      DEFAULT_CAPACITY
    )
  end

  def self.build_with_options(weather_service, name = AirportFactory::NAMES.sample, code = AirportFactory::STATUS_CODES.sample, capacity = DEFAULT_CAPACITY)
    Airport.new(
      name, 
      generate_id(5), 
      code, 
      weather_service, 
      capacity
    )
  end

end