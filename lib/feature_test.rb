require_relative 'control_tower'
require_relative 'aircraft'

control = ControlTower.new
aircraft1 = Aircraft.new
p control
p aircraft1
control.instruct(aircraft1, landing)
