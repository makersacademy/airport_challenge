# understanding plane objects
class Plane
  attr_reader :status
  def initialize
    @status = 'flying'
  end
  
  def flying?
    @status = "flying"
  end

  def taxi?
    @status = "taxi"
  end
end
