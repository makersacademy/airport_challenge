
class Airport

#attr_reader :airport

  def airport?
   true
  end

  def runway(land_plane, take_off)
   if '#{land_plane}' == "runway_free"
   elsif '#{take_off}' == "plane in taxi"
   end
 end

end
