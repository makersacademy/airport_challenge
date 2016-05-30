class Plane
attr_writer :flying
def initialize
  @flying = true
end

def flying?
  @flying
end

end