class NotAPlaneError < StandardError

  DEFAULT_MESSAGE = 'The object entered was not a plane'.freeze
  
  def initialize(object)
    @object = object
    super(DEFAULT_MESSAGE)
  end

  def object_passed
    @object.class
  end
end
