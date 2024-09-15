require_relative "plane"

class Airport
  # Default capacity is made a constant and set to 5.
  DEFAULT_CAPACITY = 5 
  @@existing_airport_count = 0
  @@airport_log = []
  
  # Created instances of the Airport class.
  # These start empty with the default capacity of 5 planes.
  def initialize(capacity = DEFAULT_CAPACITY)
    # Initially there are no airports as no instances of the class have been created.
    @@airport_log = airport_log
    @@existing_airport_count = existing_airport_count
    @@airport_capacity = capacity
  end 

  # Creates an airports with increasing numerical IDs
  def self.create(num)
    num.times do
      @@existing_airport_count += 1
      airport_id = "Airport#{@@existing_airport_count}"
      puts "New airport created. ID: #{airport_id}"
      @@airport_log << {
        :airport_id => airport_id, 
        :airport_capacity => DEFAULT_CAPACITY, 
        :airport_plane_status => 0, 
        :landed_planes => "" 
      }
    end
  end

  # Prints the number of airports that have been created/exist.
  def self.count
    puts "There are #{@@existing_airport_count} airports existing."
  end

  # Lands a specified plane in a specified airport.
  def self.land(plane, airport)
    plane_id = plane
    airport_id = airport
    if @@airport_log.include?(plane_id)
      puts "#{plane_id} is already currently landed."
    elsif full?(airport_id) == true
      puts "Cannot land plane: Capacity is full"
    elsif stormy? == true
      "Cannot land plane: weather is stormy"  
    else
      @@airport_log[:airport_id, :landed_planes] << plane_id
    end
  end
  
  def self.takeoff(plane, airport)
  #  fail 'Cannot takeoff plane: airport is empty' if empty?
  #  fail "Cannot takeoff plane: weather is stormy" if stormy?
  #  @planes.pop
  end

  def self.stormy? 
    if rand(1..6) > 4
      true
    else
    end
  end

  # private
  # attr_reader :bikes

  def self.full?(airport)
    @@airport_log.detect { |item| item[:airport_id] == airport }[:airport_plane_status]
  end

  def self.empty?(airport)
    airport_id = airport
    if (@@airport_log[airport_id, :airport_plane_status]).zero?
      true
    end
  end

  def self.status
    puts @@airport_log
  end
end