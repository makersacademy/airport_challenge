class NotAnAirportError < StandardError

  DEFAULT_MESSAGE = 'Not an airport'.freeze
  
  def initialize(object, message = DEFAULT_MESSAGE)
    @object = object
    super(message)
  end

  def object_passed
    @object.class
  end
end
