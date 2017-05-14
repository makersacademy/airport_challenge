class Weather

  attr_reader :current_state
  #TO BE BUILT LATER: Random State creator
  def initialize
    @current_state = :stormy
  end

  def safe?
    @current_state == :good
  end

end
