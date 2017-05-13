class Weather

  attr_reader :current_state
  #TO BE BUILT LATER: Random State creator
  def initialize
    @current_state = :good
  end

  def safe?
    @current_state == :good
  end

end
