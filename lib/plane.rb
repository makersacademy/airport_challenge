# Understands landing and taking off
class Plane
  attr_reader :status

  def initialize
    @status = 'Flying'
  end

  def change_status
    @status == 'Flying' ? (@status = 'Landed') : (@status = 'Flying')
  end
end
