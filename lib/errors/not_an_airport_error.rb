class NotAnAirportError < StandardError

  DEFAULT_MESSAGE = 'Airport code error, this may be because the plane is still' +
                    'in the air, or there'.freeze
  
  def initialize(object, message = DEFAULT_MESSAGE)
    @object = object
    super(message)
  end

  def object_passed
    @object.class
  end
end
