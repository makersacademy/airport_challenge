require_relative 'airport'
require_relative 'weather'
class Plane
attr_reader : status

# start with intialises planes in air? not sure
def initialize(status = "In Air")

  @status = status

end
