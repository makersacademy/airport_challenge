class Passenger
  attr_reader :status
  alias_method :checked_in?, :status

  def initialize(options = {})
    options = defaults.merge(options)
    @status = options[:checked_in]
  end

  def check_in
    @status = true
    self
  end

  private

  def defaults
    { checked_in: false }
  end
end
