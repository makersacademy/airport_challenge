class Airport
  attr_accessor :name
  attr_accessor :log
  attr_accessor :weather

  def initialize(name)
    @name = name
    @log = []
    @weather = "sunny"
  end

  def log_plane(plane)
    @log << plane
  end

  def planes
    if @log.count == 1
      puts "#{@log.count} plane at the airport"
    else
      puts "#{@log.count} planes at the airport"
    end
  end

  def skies_clear(number = rand(10))
    if number == 9
      @weather = "stormy"
      fail "Approach unsafe"
    else
      @weather = "sunny"
    end
  end
end
