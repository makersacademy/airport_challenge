class Plane
  STATES = { landed: true, in_air: false }.freeze

  def initialize
    @id = 'p1'
    @state = STATES[:in_air]
  end

  attr_reader :state

  attr_reader :id
end
