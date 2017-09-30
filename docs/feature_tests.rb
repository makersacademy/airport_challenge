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
'


#step 4

2.4.0 :053 > a_path = './lib/airport.rb'
 => "./lib/airport.rb"
2.4.0 :054 > p_path = './lib/plane.rb'
 => "./lib/plane.rb"
2.4.0 :055 > load a_path
 => true
2.4.0 :056 > load p_path
 => true
2.4.0 :057 > airport = Airport.new
 => #<Airport:0x007fb5aa096f70>
2.4.0 :058 > plane = Plane.new
 => #<Plane:0x007fb5a91ca690>
2.4.0 :059 > airport.take_off
 => nil
 2.4.0 :061 > airport.take_off
 => nil
2.4.0 :062 > airport.take_off
