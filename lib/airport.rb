require_relative 'plane'
# require_relative 'weather'
class Airport
  attr_reader :hangar, :condition

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY, status = 'safe')
    @capacity = capacity
    @hangar = []
    @condition = status
  end

  def safe?(status = 'yes')
    status == 'yes' ? (@condition = 'safe') : (@condition = 'not safe')
    @condition == 'safe'
  end

  def landing(plane)
    fail 'Hangar is full' if full?
    if !safe?
      fail 'It is not safe to land'
    else
      plane.landed
      @hangar << plane
    end
  end

  def taking_off(plane)
    fail 'Hangar is empty' if @hangar.empty?
    if safe?
      plane.taken_off
      @hangar.include?(plane) ? @hangar.delete_at(@hangar.index(plane)) :
      "Plane not in the hangar"
      plane
    else
      fail 'It is not safe to fly'
    end

  end

  private
  def full?
    @hangar.count >= @capacity
  end

  def empty?
    @hangar.count.zero?
  end

end
