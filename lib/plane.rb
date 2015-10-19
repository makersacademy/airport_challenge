class Plane

attr_reader :status, :where

  def initialize
    @status = "Flying"
  end

  def log(airport)
    fail "Plane already at airport" if status == "Not Flying"
    @where = airport
    @status = "Not Flying"
  end

  def unlog
    fail "Plane already flying" if status == "Flying"
    @where = "In Air"
    @status = "Flying"
  end
end
