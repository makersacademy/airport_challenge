require_relative 'plane'

storm = false

def storm_check
  chance = rand(6)
  if chance == 5
    return storm = true
  else
    return storm = false
  end
end
