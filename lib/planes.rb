class Plane
  attr_reader :status

  def initialize
    @status = :flying
  end

  def change_status
    @status == :landed ? @status = :flying : @status = :landed
  end

  def landed?
    @status == :landed
  end
end
