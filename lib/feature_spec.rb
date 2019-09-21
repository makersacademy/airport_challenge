# specification diagrams

# 1. DONE Airport <-- planes land
# 2. DONE Airport --> planes takeoff (and confirm no longer at airport)
# 3. DONE Airport (stormy) --> planes do not takeoff 
# 4. DONE Airport (stormy) --> planes do not land
# 5. DONE Airport (full) --> planes do not land
# 6. DONE Default airport capacity that can be overridden

# DONE random number generator for weather (normally sunny, rarely stormy)
# DONE override random weather behaviour to test doubles

# DONE Make sure to update my README
# Land and take off a certain number of planes
# planes can only take off from airports they are in; 
# planes that are already flying cannot take off and/or be in an airport; 
# planes that are landed cannot land again and must be in an airport, etc.