# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

describe 'Airport capacity setup feature' do
  it 'allows the designer to customise the airport capacity' do
    given_an_airport_with_a_custom_capacity(1)
    when_the_weather_is_clear
    and_the_airport_reaches_capacity
    then_another_plane_cannot_land(1)
  end
end