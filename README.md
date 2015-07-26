--- Domain Model Notes ---

1. If a plane is flying, then it isn't landed, and vice versa, which obviates the need for a 'landed' state.
2. Planes ask for permssion to land and take-off.
3. Air traffic controllers either allow takes_offs (or not) or allow landing (or not). The model captures the concept of an airport 'instructing' a landing or a take-off by planes asking airports for permission to land or take-off. 

-- Class/Method Notes ---

4. A plane's #land sends an airport a request to land, and gets an answer back from the airport's #plane_in.
5. A plane's #take_off sends an airport a request to leave, and gets an answer back from the airport's #plane_out.
6. #plane_in and #plane_out get weather reports before they respond, while #plane_in also checks to see if there is available space.
7. Weather reports are procured from a seperate WeatherReport Class. The purpose for this encapsulation is to allow for multiple airports to have different weather reports.


