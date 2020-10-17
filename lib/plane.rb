class Plane

  attr_accessor(:status)
  attr_reader(:name)

  def initialize(name = "plane")
    @name = name
    @status = "flying"
  end
end
