class Plane
attr_reader :state
attr_reader :requested

def initialize(state="landed")
  @state = state
  @requested = "none"
end

def set_request(requested)

  if @state == "landed" && requested == "take off"
    @requested = requested
  elsif @state = "flying" &&  requested == "land"
    @requested = requested
  else
    @requested = "none"
  end
end

def get_request
  @requested
end

def allow
  if @requested == "land"
    @state="landed"
  elsif @requested == "take off"
    @state="flying"
  else
  end
end



end
