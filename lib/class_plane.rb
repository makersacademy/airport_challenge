class Plane
  @@planes = []
  attr_accessor :location, :destination
  attr_reader :registration

  def self.list_all_planes
    @@planes
  end

  def self.clear_all_planes
    @@planes =[]
  end

  def initialize
    @registration = registration_new
    @destination = ''
    @location = 'in_factory'

    @@planes << self
  end

  def land
    if destination_full?
      puts "Destination airport is full - abort landing"
      false
    elsif destination_stormy?
      puts "Destination airport is stormy - abort landing"
      false
    else
      @location = @destination
    end
  end

  def take_off
    if !destination_set?
      puts "No destination set - abort take off"
      false
    elsif current_stormy?
      puts "Current airport is stormy - abort take off"
      false
    else
      @location = "in_air"
    end
  end

  private
  def registration_new
    if @@planes.size < 1
      "G-AAAA"
    else
      @@planes[-1].registration.succ
    end
  end

  def destination_set?
    Airport.list_all_airports.include? @destination
  end

  def destination_full?
    @destination.full?
  end

  def destination_stormy?
    @destination.stormy?
  end

  def current_stormy?
    @location.stormy? if @location.is_a?(Airport)
  end
end
