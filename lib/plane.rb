require_relative 'flight_codes'

class Plane
  attr_reader :flight_no, :origin, :destination

  def initialize
    @flight_no = flight_no_generator
    @origin = get_origin
    @destination = CountryCodes.new.search_by_code("xx")
  end

  def flight_no_generator
    @c_code = CountryCodes.new.country_codes.sample
    @c_code + rand(99999).to_s
  end

  def get_origin
    @origin = CountryCodes.new.search_by_code(@c_code)
  end

  def set_destination
    dest_no = flight_no_generator
    @flight_no = dest_no
    @origin = CountryCodes.new.search_by_code("xx")
    code = dest_no.split("").first(2).join
    @destination = CountryCodes.new.search_by_code(code)
  end
end
