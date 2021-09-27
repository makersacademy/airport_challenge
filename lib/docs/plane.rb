class Plane
  # Before any plane class instances are created there are zero planes.
  # An empty array is created to keep a log of all planes created.
  @@plane_log = []
  @@existing_plane_count = @@plane_log.length
  
  # Plane instances are created and logged.
  def initialize
    @@plane_log << "Plane#{@@existing_plane_count + 1}"
    puts "New plane created. ID: Plane#{@@existing_plane_count + 1}"
  end 

  # Creates planes with increasing numerical IDs
  def self.create(number)
    number.times do
      @@existing_plane_count += 1
      plane_id = "Plane#{@@existing_plane_count}"
      puts "New plane created. ID: #{plane_id}"
      @@plane_log << plane_id
    end
  end

  # Prints the number of planes that have been created/exist.
  def self.count
    puts "There are #{@@existing_plane_count} planes existing."
  end

  # Prints the existing plane IDs.
  def self.id
    puts "Plane IDs:"
    puts @@plane_log
  end

end
    