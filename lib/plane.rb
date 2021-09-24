class Plane
  def landing?
    if @weather == 'stormy'
      return "Landing delayed"
    else 
      @weather == 'sunny'
      return "Proceed to landing."
    end    
  end
end