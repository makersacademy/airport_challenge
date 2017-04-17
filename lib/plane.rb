class Plane
  require_relative "airport"
  require_relative "weather"

  def grounded?
    if instance_variable_get(:@planes).include?(@plane)
      true
    else
      false
    end
  end
end
