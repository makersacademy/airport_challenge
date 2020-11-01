class Plane
  attr_reader :docked

  def initialize
    @docked = false
  end

  def landed
    raise 'Unauthorized, ATC request' if !atc_request?
    @docked = true
  end

  def flying
    @docked = false
  end

  private

  def atc_request?
    %w[land].include?(caller[1][/`.*'/][1..-2])
  end
end