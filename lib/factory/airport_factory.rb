require_relative '../domain/airport'
require_relative './id_generator'

class AirportFactory
  extend IdGenerator

  DEFAULT_CAPACITY = 20

  AIRPORTS = [
    { name: "Heathrow", code: :LHR },
    { name: "Hartsfield–Jackson Atlanta International Airport", code: :ATL },
    { name: "Denver International Airport", code: :DEN },
    { name: "Dallas/Fort Worth International Airport", code: :DFW },
    { name: "Los Angeles International Airport", code: :LAX },
    { name: "O'Hare International Airport", code: :ORD },
    { name: "Amsterdam Airport Schiphol", code: :AMS },
    { name: "Istanbul Sabiha Gökçen International Airport", code: :IST },
    { name: "Beijing Capital International Airport", code: :PEK },
    { name: "Shanghai Pudong International Airport", code: :CDG },
    { name: "Charles de Gaulle Airport", code: :PVG },
    { name: "Frankfurt Airport", code: :FRA },
    { name: "Orlando International Airport", code: :MCO },
    { name: "Dubai International Airport", code: :DXB },
    { name: "Indira Gandhi International Airport", code: :DEL },
    { name: "Tokyo Haneda Airport", code: :HND },
    { name: "Jeju International Airport", code: :CJU },
    { name: "São Paulo/Guarulhos International Airport", code: :GRU },
    { name: "Seattle–Tacoma International Airport", code: :SEA }
  ].freeze

  def self.build
    airport = rand(0...AIRPORTS.length)
    Airport.new(
      AirportFactory::AIRPORTS[airport][:name], 
      AirportFactory::AIRPORTS[airport][:code], 
    )
  end

  def self.build_with_options(
    name = AirportFactory::AIRPORTS.sample[:name], 
    code = AirportFactory::AIRPORTS.sample[:code],
    capacity = DEFAULT_CAPACITY)
    Airport.new(
      name,
      code,
      capacity
    )
  end

end
