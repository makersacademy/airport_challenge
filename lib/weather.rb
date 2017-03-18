module Weather

  Determiner = rand(10)

  Determiner < 2 ? Weather = 'stormy' : Weather = 'sunny'

end
