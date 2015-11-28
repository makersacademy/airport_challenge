class Airport

DEFAULT_CAPACITY = 20
attr_reader :default_capacity

def initialize(def_capacity = DEFAULT_CAPACITY)
  @default_capacity = def_capacity
end

end
