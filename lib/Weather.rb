require_relative 'Airport.rb'

class Weather

def stormy?

random_outlook == :stormy

end



private

OUTLOOKS = [ :stormy, :ok, :ok, :ok]

def random_outlook

OUTLOOKS.sample

end


end
