class Weather
    
    def initialize
      @stormy = false
      @sunny = true
      @landing = false
    end
  
    def departure?
      @stormy
    end
  
    def fly
      @sunny
    end
  end