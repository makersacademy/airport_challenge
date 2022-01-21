Airport Challenge

PROCESS

My approach to the coding challenge was to use TDD extensively, line by line, to push for what I must do next, from method to method.

At the point where this becomes unuseable (ie raise_error testing) I trust I will be confident enough to fill that space and recieve a successful test on completion.

Each step of the TDD will be a goal, and an achievement, which will motivate my progress.

Any errors will be debugged using the messages provided, and google will be used to knowledge fill when I am stuck, or to consolidate knowledge if I am unsure why something has worked.

CODE TIDYING

Keep code concise, readable, understandable and in line with SRP (!= Singular Porpoise Reliability), unlike those parenthesis.

def takeoff(plane)
    @airborne << @docked.delete(plane) unless weather_error_takeoff
  end

  private

  def forecast_sum
    @forecast = @weather.sample
  end

  def full_error
    fail "Airport Full" if @docked.length >= @capacity 
  end

  def weather_error_takeoff
    fail "Cannot take off in this weather" if @forecast == 'stormy'
  end

CODE COVERAGE
I finished with a 98% (95.83% in the offending file) coverage rate, which I elected not to cover as it was a private line, and I understand that these need not be tested on?
(May be old information)

FEEDBACK
I look forward to thie being reviewed and to tell me where I've gone wrong or can improve. 