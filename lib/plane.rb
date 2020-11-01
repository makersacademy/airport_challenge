class Plane
  attr_reader :docked

  def initialize
    @docked = false
  end

  def landed
    raise 'Unauthorized, ATC request' if not_atc_request?
    @docked = true
  end

  def flying
    raise 'Unauthorized, ATC request' if not_atc_request?
    @docked = false
  end

  private

  def not_atc_request?
    !%w[land take_off].include? caller[1][/`.*'/][1..-2]
  end
end