As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport


Class - Airport
Class - Plane

method - land
Input                                     Output
Flying Plane => [land] => Flying Plane lands at Airport and becomes grounded. Increases plane_count by 1.
Grounded Plane => [land] => Output warning "This plane is already grounded at the airport"


method - take_off
Input                                     Output
Grounded Plane => [take_off] => Grounded plane departs at airport, becomes flying plane, message output confirming it has left, + decreases plane_count by 1.
Flying Plane => [take_off] => Output warning "This plane is already flying"


method - plane_limit
Input                                           Output
Max amount of planes hit => [plane_limit] => More flying planes not allowed land at airport
Under max amount of planes hit => [plane_limit] => Flying plans can land at airport

method - set_limit
Input                                     Output
Define max no. of planes => [set_limit] => Becomes max amount of planes for plane_limit method

method - stormy_take_off
Input                                     Output
Normal weather => [stormy_take_off] => Grounded plane can take_off from airport
Stormy weather warning => [stormy_take_off] => Override method take_off so grounded plane cannot take_off from airport

method - stormy_land
Input                                     Output
Normal weather => [stormy_land] => Flying plane can land at airport
Stormy weather warning => [stormy_land] => Override method take_off so flying plane cannot leave airport


class - weather
Input                                     Output
1, 2, 3, 4, 5 => [weathercheck] => Weather is clear
6 => [weathercheck] => weather is stormy



Added later, as realised more effective to use instances of Plane class
method- plane_status
Input                                     Output
Flying Plane => [plane_status] => Returns that the plane is flying
Grounded Plane => [plane_status] => Returns that the plane is grounded at airport

