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
