Objects		Messages
Airport		instruct_to_land
Airport		instruct_to_take_off
Airport		full?
Airport		stormy?
Airport		initialize(capacity)
Airport		initialize(name)
Plane		initialize(airport_location)
Plane		at_my_airport?
Plane 		flying?

my Airport <—- instruct_to_land —-> a Plane
my Airport <—- instruct_to_take_off —-> a Plane
my Airport <—- full? —-> true/false —-> instruct_to_land: OK if true/raise “issue” if false
my Airport <—- stormy? —-> true/false —-> instruct_to_land & instruct_to_take_off: OK if true/raise “issue” if false
my Airport <—- initialize —-> capacity

a Plane <—- at_my_airport? (i.e. name == airport_location) —-> true/false —-> instruct_to_take_off: OK if true/raise “issue” if false

a Plane <—- flying? —-> true/false —-> instruct_to_land: OK if true/raise “issue” if false;  
instruct_to_take_off: OK if false/raise “issue” if true; airport_location: nil if true/name if false 