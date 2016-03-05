require_relative 'control_tower'
require_relative 'aircraft'

control = ControlTower.new
aircraft1 = Aircraft.new
aircraft2 = Aircraft.new

p control
p aircraft1
p aircraft1.landed
aircraft1.change_status
p aircraft1.landed
p aircraft2.landed

control.check_status(aircraft1)
