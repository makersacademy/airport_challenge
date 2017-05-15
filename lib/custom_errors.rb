# Custom error classes for use with airport_challenge

class BadWeatherError < StandardError; end
class NoRoomError < StandardError; end
class NoPlanesError < StandardError; end
class PlaneStatusError < StandardError; end
class NoClearanceError < StandardError; end