class Plane
  attr_reader :name
  attr_accessor :status

  def initialize(name)
    @name = name
    @status = "flying"
  end
end
