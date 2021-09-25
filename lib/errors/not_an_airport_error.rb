class NotAnAirportError < StandardError

  DEFAULT_MESSAGE = 'Not an airport'.freeze
  
  def initialize(object)
    @object = object
    super(DEFAULT_MESSAGE)
  end

  def object_passed
    @object.class
  end
end
