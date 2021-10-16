class Plane
  STATES = { landed: true, in_air: false }.freeze
  attr_reader :state

  def initialize
    @state = STATES[:in_air]
  end

  def take_off
    fail 'already in state: in air' unless @state == STATES[:landed]
    update_state(STATES[:in_air])
    confirm_take_off
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
