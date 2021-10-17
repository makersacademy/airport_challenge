class Plane
  STATES = { landed: true, in_air: false }.freeze
  attr_reader :state
  attr_reader :airport_id

  def initialize
    @state = STATES[:in_air]
    @airport_id = -1
  end

  def take_off(airport_id)
    fail 'already in state: in air' unless @state == STATES[:landed]
    fail 'plane not a this airport' unless @airport_id == airport_id
    update_state(STATES[:in_air])
    confirm_take_off
  end

  private def confirm_take_off
    'confirmed take off'
  end
  private def update_state(state)
    @state = state
  end

  def land(airport_id)
    fail 'already in state: landed' unless @state == STATES[:in_air]
    update_state(STATES[:landed])
    @airport_id = airport_id
  end
end
