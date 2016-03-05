require 'control_tower'

describe ControlTower do

  it { is_expected.to respond_to(:instruct).with(2).arguments }


end
