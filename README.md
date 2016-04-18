Airport Challenge
------------------
Folder Tree:
```
── lib
│   ├── airport.rb
│   ├── plane.rb
│   └── weather.rb
└── spec
    ├── airport_spec.rb
    ├── plane_spec.rb
    ├── spec_helper.rb
    └── weather_spec.rb
```
Description
----
Implement a very basic software to control the flow of planes at an airport. As such, it was necessary to create three different classes: Airport, Plane and Weather, that will interact with one another, as well as method such as land and take_off and variables as capacity and number of planes at the airport at the time.

Technologies used
-----------------
- Ruby
- Rspec

Code Snippet
------------
```
1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> London  = Airport.new
=> #<Airport:0x007f80b3985068 @capacity=10, @planes=[]>
[3] pry(main)> Boeing = Plane.new
=> #<Plane:0x007f80b3925f50>
[4] pry(main)> London.land Boeing
=> [#<Plane:0x007f80b3925f50>]
[5] pry(main)> Boeing.landed?
=> true
[6] pry(main)> London.planes
=> [#<Plane:0x007f80b3925f50 @landed=true>]
[7] pry(main)>
```
By
--
Emilio Menendez
