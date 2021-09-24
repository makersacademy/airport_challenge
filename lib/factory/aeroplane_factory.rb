require 'securerandom'
require 'aeroplane'

class AeroplaneFactory

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
    Aeroplane.new(SecureRandom.uuid, AeroplaneFactory::NAMES.sample, 100)
  end

  def self.build_with_capacity(capacity)
    Aeroplane.new(SecureRandom.uuid, AeroplaneFactory::NAMES.sample, capacity)
  end

  def self.build_with_name(name)
    Aeroplane.new(SecureRandom.uuid, name, 100)
  end

  def self.build_with_name_and_capacity(name, capacity)
    Aeroplane.new(SecureRandom.uuid, name, capacity)
  end

end
