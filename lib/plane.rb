class Plane
  STATES = { landed: true, in_air: false }.freeze

  def initialize
    @id = 'p1'
    @state = STATES[:in_air]
  end

  attr_reader :state

  attr_reader :id

  def take_off
    fail 'already in state: in air' unless @state == STATES[:landed]
    confirm_take_off
    update_state(STATES[:in_air])
  end

  private def confirm_take_off
    'confirmed take off'
  end
  private def update_state(state)
    @state = state
  end

  def land
    fail 'already in state: landed' unless @state == STATES[:in_air]
    update_state(STATES[:landed])
  end

end
