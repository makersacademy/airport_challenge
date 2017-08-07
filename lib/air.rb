class Air
  attr_accessor :name, :planes

  def initialize(name)
    @planes = []
    @name = name
  end

  def status
    "In #{@name.capitalize}'s airspace: #{list}"
  end

  def list
    return "none" if @planes.empty?
    list = []
    @planes.each { |x| list << x[1] }
    list.flatten.join(" ")
  end

end
