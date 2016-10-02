require_relative 'airport'

class Plane

attr_accessor :flying, :status

  def initialize
    @flying = nil
  end

  def flying?
    @flying
  end


end
