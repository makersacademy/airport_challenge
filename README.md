#README#

##Functional Representation##

Objects | Messages
------- | --------
Air traffic controller |
Airport | land
Plane | landed?
Airport | take_off
Plane | departed?
Stormy Weather | prevent_take_off
Stormy Weather | prevent_landing
Airport | full?
Airport | default_capacity


##Diagram##
Plane <-- landed? -- > true/false  
Plane <-- departed? --> true/false
Airport <-- land --> lands plane
Airport <-- take_off --> plane departs
Stormy Weather <-- prevent_take_off --> prevents plane taking off
Stormy Weather <-- prevent_landing --> prevents plane landing
Airport <-- full? --> prevents plane landing
Airport <-- default_capacity --> default capacity of planes of an airport
