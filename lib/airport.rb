class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
    puts "#{plane.name} has landed"
    puts "Hangar now holds #{display_hangar}"
  end

  private
  def display_hangar
    return if @hangar.empty?
    names = @hangar.map { |plane| plane.name }
    names.join(", ")
  end
end
