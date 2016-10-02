class Plane
attr_accessor :landed, :taken_off, :l, :t, :land, :take_off, :in_airport
  def initialize
    @taken_off = false
    @landed = false
    @in_airport = true
  end


=begin
  def take_off
    @taken_off = true
  end

  def land
    @landed = true
  end
=end


end
