require_relative 'flight_codes'

class Plane
  include CountryCodes
  attr_reader :flight_no, :origin, :destination

  def initialize
    @flight_no = flight_no_generator
    @origin = generate_code
    @destination = search_by_code(@c_code)
  end

  def flight_no_generator
    @c_code = generate_code
    @c_code + rand(99999).to_s
  end

  def set_destination
    @flight_no = flight_no_generator
    @origin = search_by_code("xx")
    code = @flight_no.split("").first(2).join
    @destination = search_by_code(code)
  end
end
