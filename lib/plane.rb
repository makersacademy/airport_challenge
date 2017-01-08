class Plane

attr_reader :landed_status

def initialize(landed_status="Airbourne")
  @landed_status = landed_status
end

def change_status(new_status)
  @landed_status = new_status
end
end
