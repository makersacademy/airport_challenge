class Air
  attr_accessor :name, :planes

  def initialize(name)
    @planes=[]
    @name=name
  end

  def status
    puts "In the #{@name.capitalize} airspace: #{self.list}"
  end

  def list
    return "none" if @planes.empty?
    list= []
    @planes.each{|x| list<< x[1]}
    list.flatten.join(" ")
  end

end
