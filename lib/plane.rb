class Plane

  attr_reader :status
  attr_writer :status

  def initialize
    @status = :flying
  end

end
