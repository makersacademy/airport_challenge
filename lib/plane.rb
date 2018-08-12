require_relative 'flight_codes'

class Plane
  attr_reader :flight_no, :condition, :origin, :destination

  def initialize(condition=:working, origin=nil)
    @flight_no = flight_no_generator
    @condition = condition
    @origin = get_origin
    @destination = nil
  end

  def flight_no_generator
    c_code = CountryCodes.new.country_codes.sample
    self.object_id.to_s.split("")[9, 14].join + c_code
  end

  def get_origin
    code = @flight_no.split("").last(2).join
    @origin = CountryCodes.new.search_by_code(code)
  end

  def set_destination
    dest_no = flight_no_generator
    @flight_no = dest_no
    @origin = CountryCodes.new.search_by_code("xx")
    code = dest_no.split("").last(2).join
    @destination = CountryCodes.new.search_by_code(code)
  end
end
