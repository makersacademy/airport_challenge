# step 1

airport = Airport.new

# NameError: uninitialized constant Airport
# 	from (irb):1
# 	from /Users/rorycollins/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'


# step 2

require './lib/airport.rb'
# true
airport = Airport.new
#<Airport:0x007facf70f3768>
airport.land
# NoMethodError: undefined method `land' for #<Airport:0x007facf70f3768>
# 	from (irb):3
# 	from /Users/rorycollins/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'

#step 3


2.4.0 :001 > path = './lib/airport.rb'
 => "./lib/airport.rb"
2.4.0 :002 > load path
 => true
2.4.0 :003 > airport = Airport.new
 => #<Airport:0x007fb5aa1071a8>
2.4.0 :004 > plane.land
NameError: undefined local variable or method `plane' for main:Object
	from (irb):4
	from /Users/rorycollins/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :005 > airport.land
 => nil
2.4.0 :006 > airport.land(plane)
NameError: undefined local variable or method `plane' for main:Object
	from (irb):6
	from /Users/rorycollins/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :007 > plane = Plane.new
NameError: uninitialized constant Plane
	from (irb):7
	from /Users/rorycollins/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
