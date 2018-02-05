## Weather in separate class by Jenny Arenas



to use functions from a separate weather class:
- require_relative 'weather' file
- in initialize, put instance variable Weather
  @weather = Weather.new

  then on @weather we can call methods defined in Weather class.

## !!!!!!!!!! When you put a private method, you don't have to test the private methods in rspec !!!!!!!!!!
