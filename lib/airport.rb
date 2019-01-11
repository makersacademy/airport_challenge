# # to do
# # change take_offandlandstatus to can_take_off_and_land?
# class Airport
#
#   DEFAULT_CAPACITY = 20
#
#   attr_reader :planes, :capacity, :DEFAULT_CAPACITY
#
#   def initialize(capacity = DEFAULT_CAPACITY)
#     @planes = []
#     @capacity = capacity
#   end
#
#   def can_land?
#     stormy? || full? ? false : true
#   end
#
#   def can_take_off?
#     stormy? ? false : true
#   end
#
#   def plane_landing(plane)
#     @planes.append(plane)
#     self
#   end
#
#   def change_capacity(new_capacity)
#     @capacity = new_capacity
#     self
#   end
#
#   def plane_taking_off(plane)
#     @planes.delete(plane)
#     self
#   end
#
#   def plane_entering_on_ground(plane)
#     @planes.append(plane)
#     self
#   end
#
#   private
#
#   def full?
#     @planes.length >= @capacity
#   end
#
#   def stormy?
#     rand(1..100) < 5
#   end
# end
