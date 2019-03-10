# Weekend 1 Aiport challenge... yay!

# Goals
# 1. Have planes land at the Airport
# => Create an airport class **Done
# => Create a plane class. **Done
# => Get them to play nicely together
# => Make use of an array to keep track of whats going on

# 2. Have planes depart the Airport
# => Have plane remove an instance from the airport array
# => Add confirmation

# 3. Prevent bad weather takeoff
# => Make a weather method
# => Use the method as a argument
# =>

# 4. Prevent bad weather landing
# => A reflection of th last condition

# 5. Prevent landing when airport is full
# => How full is "full"?
# => Maybe add a randomiser
# =>

# 6. Throw health and safety the finger and overwrite
#    all common sense. OR Overwrite airport full feature
# => Set default full value, otherwise add a new one.

# 7. Beware the dreaded 'edge case'
# => Safeguard this by having grounded and flying states
# => Assign planes airport statuses (stati? statusseseses?)
# =>

# 8. Make use of test doubles... they are your friend
# =>

# 9. Bonus brownie points
# => Able to handle multiple planes at once... like a proper airport
# => Keep it simple stupid!
# => Be awesome


# !!!!!!!!!!IMPORTANT!!!!!!! REMEMBER TO UN-COMMENT SPEC_HELPER!!!!!!!!
class Airport
# initialize area
def initialize(capacity)
  @capacity = capacity
  @planes = []
end

# build area
  def land(plane)
    raise 'Cannot land plane; Airport full' if @planes.length >= @capacity
    @planes << plane
  end

  def take_off(plane)
  end
end
