class Plane

def initialize
  @landed = true
end

def land=(boolean) #setter
  @landed = boolean
end

def landed? #getter
  @landed
end

def flying
  self.land=(false) #calling the landed= method on the instance of the class itself
end

end
