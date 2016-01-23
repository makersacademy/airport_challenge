require_relative '../lib/control_room'

describe ControlRoom do
  subject(:ControlRoom) {described_class.new}

  let(:airport) {double :airport}
  let(:plane) {double :plane}
  let(:weather) {double :weather}

end
