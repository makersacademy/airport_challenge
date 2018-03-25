class Plane
  @@rl = "_ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  attr_accessor :plane
  def self.new
    @name = ""
    @name << @@rl[rand(26).to_i]
    @name << @@rl[rand(26).to_i]
    @name << rand(100..999).to_s
  end

end

# puts Plane.new
