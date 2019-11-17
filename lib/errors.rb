class Errors

  ERR_MSG = [
  "No planes at the airport",
  "Plane cannot take off due stormy weather",
  "Cannot take off, Plane not at specified airport",
  "Plane cannot land as the Airport is full",
  "Plane cannot land as the conditions are stormy"
  ]

  def initialize(code)
    @code = code
  end

  def message
    ERR_MSG[@code]
  end
end
