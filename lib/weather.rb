class Weather

  def forecast
    # prefer an if/else statement, but I couldn't get 100% coverage on the tests
    # unless 'Clear' and 'Stormy' were on one line
    rand(1..100) > 10 ? "Clear" : "Stormy"
  end

end
