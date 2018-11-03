class Plane
  attr_accessor :name, :location

  def initialize
    @name = []
    @location = "Ground"
    name
  end

  def name
    if @name.length == 5
      return @name
    else
      create_name
    end
  end

  def create_name
    characters = ('A'..'Z').to_a
    numbers = ('1'..'9').to_a
    3.times do
      @name << characters.sample
    end
    2.times do
      @name << numbers.sample
    end
    @name = @name.join
  end

end
