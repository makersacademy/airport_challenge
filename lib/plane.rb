class Plane

  attr_reader :status, :current_airport

  @@messages = {
    :ground => "This plane is currently on the ground.",
    :flying => "This plane is currently flying.",
   }

  def initialize(status = :flying, airport = nil)
    @status = status 
    @current_airport = airport
  end

  def land(airport)
    return unless landing_ok?(airport)
    @status, @current_airport = :ground, airport
  end

  def take_off(airport)
    return unless take_off_ok?(airport)
    @status, @current_airport = :flying, nil
  end

private

  def landing_ok?(airport)
    return false if status_issue?(:ground)
    return true if airport.request(:landing, self)
  end

  def take_off_ok?(airport)
    return false if status_issue?(:flying) 
    return true if airport.request(:take_off, self)
  end

  def status_issue?(new_status)
    engage(@status) if @status == new_status
    @status == new_status
  end

  def engage(message)
    puts @@messages[message]
  end

end
