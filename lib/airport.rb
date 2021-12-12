require './lib/plane'
# Airport class
class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :planes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    # create a planes array
    @planes = []
    @capacity = capacity # Default is 5 but now it can be updated
  end

  def land(plane)
    
    stormy?
    # error when airport is full
    fail 'Airport is currently full. There is not any space for landing...' if full?
    # error when weather is stormy
    fail 'The weather conditions do not allow for safe landing...' if stormy? == 'Stormy'
    # and plane will be pushed to planes array
    @planes << plane
  end

  def take_off(plane)
    stormy?
    # error when weather is stormy
    fail 'The weather conditions do not allow for safe take-off...' if stormy? == 'Stormy'
    # take off a plane
    @planes.delete(plane)
  end

  private

  def full?
    # full method
    @planes.count >= capacity
  end

  def stormy?
    # According to the user story weather condition can be sunny or occasionally stormy. 
    ['Sunny','Stormy'].sample
  end
end
