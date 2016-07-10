require_relative 'weather'

class Plane

  #def safe_to_land?(weather_report)
    #fail "Unable to land due to stormy conditions" if weather_report == "stormy"
    #@clear_for_landing = true
  #end

  def landed?
    true
  end

  def departed?
    true
  end
end
