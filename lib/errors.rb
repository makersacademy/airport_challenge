class Errors
  # planes
  CURRENTLY_AIRBORNE = "This plane is already airborne"
  CURRENTLY_GROUNDED = "This plane is already grounded"
  NO_AIRPORT = "This plane needs an airport to take off"
  
  # airports
  AT_CAPACITY = "This airport is currently at capacity"
  NOT_AT_AIRPORT = "Target plane is not at this airport"
  STORMY_WEATHER_ON_TAKEOFF = "Takeoff forbidden due to bad weather conditions"
  STORMY_WEATHER_ON_LANDING = "Landing forbidden due to bad weather conditions"
  NOT_A_PLANE = "Foreign object attempting to land at airport"
end
