require_relative 'airport.rb'

class Plane

  def landed?
    status == :landed
  end

  def plane
  end

  private

  def status
    $planes.include?(plane)
  end
end
