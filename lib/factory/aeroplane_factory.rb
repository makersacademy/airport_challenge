require 'securerandom'
require_relative '../domain/aeroplane'
require_relative './plane_id_generator'

class AeroplaneFactory 
  extend PlaneIdGenerator
  
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
    Aeroplane.new(generate_id, AeroplaneFactory::NAMES.sample, 100)
  end

  def self.build_with_capacity(capacity)
    Aeroplane.new(generate_id, AeroplaneFactory::NAMES.sample, capacity)
  end

  def self.build_with_name(name)
    Aeroplane.new(generate_id, name, 100)
  end

  def self.build_with_name_and_capacity(name, capacity)
    Aeroplane.new(generate_id, name, capacity)
  end

end
