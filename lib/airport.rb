require_relative 'plane'

class Airport
  MAX_CAPACITY = 40

  def initialize(capacity=MAX_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  attr_reader :planes, :capacity

  def land(plane)
      fail "Airport full! No Planes can land!" if full?
      fail "Conditions too stormy. No planes can land." if stormy?
      fail "That plane is already on the ground!" if present?(plane)
      makes_landed(plane)
      planes << plane
  end

  def take_off(plane)
      fail "That plane isn't here!" unless present?(plane)
      fail "Conditions too stormy. No planes can take off." if stormy?
      removes_plane_from_airport(plane)
      makes_flying(plane)
      plane
  end


  def present?(plane)
    planes.include?(plane)
  end

  private

    def removes_plane_from_airport(plane)
      planes.select!{|all_planes|
      all_planes != plane}
    end

     def makes_flying(plane)
        plane.flying=(true)
     end

     def makes_landed(plane)
       plane.flying=(false)
     end

    def stormy?
      rand(1..100) >= 90 ? true : false
    end

    def full?
      planes.length >= MAX_CAPACITY
    end


end
