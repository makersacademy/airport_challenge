require_relative '../domain/aeroplane'
require_relative './id_generator'

class AeroplaneFactory 
  extend IdGenerator

  NAMES = [
    "Airbus A220", 
    "Airbus A320",
    "Airbus A330",
    "Airbus A350",
    "Airbus A380", 
    "Boeing 737",
    "Boeing 747", 
    "Boeing 767", 
    "Boeing 777",
    "Boeing 787", 
    "Concord"
  ].freeze

  def self.build
    Aeroplane.new(generate_id(8).to_sym, AeroplaneFactory::NAMES.sample)
  end

  def self.build_with_name(name)
    Aeroplane.new(generate_id(8).to_sym, name)
  end

end
