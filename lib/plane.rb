class Plane

attr_reader :status, :location  # => nil

def flying
  @status = :flying  # => :flying
  @location = :air   # => :air
  self               # => #<Plane:0x007fe6791500d8 @status=:flying, @location=:air>
end

def landed
  @status = :landed
  @location = :airport
  self
end

def flying?
  @status == :flying  # => true
end

end
