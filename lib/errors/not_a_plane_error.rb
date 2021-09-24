class NotAPlaneError < StandardError

  DEFAULT_MESSAGE = 'Not a plane'.freeze
  
  def initialize(object)
    @object = object
    super(DEFAULT_MESSAGE)
  end

  def object_passed
    @object.class
  end
end
