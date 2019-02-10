class Plane
attr_reader :state
attr_reader :requested

def initialize(state="landed")
  @state = state
  @requested = "none"
end

def set_request(request)
  @requested = "none"
  if @state == "landed" && request == "take off"
    @requested = request
  elsif @state == "flying" && request == "land"
    @requested = request
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
