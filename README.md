Airport Controller
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```



Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:


# Airport Controller
<table>
<tr>
<td>
  This is a software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

  ```
  As an air traffic controller
  So I can get passengers to a destination
  I want to instruct a plane to land at an airport and confirm that it has landed

  As an air traffic controller
  So I can get passengers on the way to their destination
  I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  As an air traffic controller
  To ensure safety
  I want to prevent takeoff when weather is stormy

  As an air traffic controller
  To ensure safety
  I want to prevent landing when weather is stormy

  As an air traffic controller
  To ensure safety
  I want to prevent landing when the airport is full

  As the system designer
  So that the software can be used for many different airports
  I would like a default airport capacity that can be overridden as appropriate
  ```
</td>
</tr>
</table>

## Code examples
xxx a code example or irb transcript:

```
$ irb
2.4.0 :001 > require './lib/weather.rb'
 => true
2.4.0 :002 > require './lib/plane.rb'
 => true
2.4.0 :003 > require './lib/airport.rb'
 => true
2.4.0 :004 > plane = Plane.new
 => #<Plane:0x007f9c4c90b3d0 @taken_off=false, @landed=false>
2.4.0 :005 > airport = Airport.new 10
 => #<Airport:0x007f9c4c902e60 @capacity=10, @landed_planes=[], @weather=#<Weather:0x007f9c4c902e38>>
2.4.0 :006 > weather = Weather.new
 => #<Weather:0x007f9c4c8fb0c0>
2.4.0 :007 > airport.land(plane)
RuntimeError: Cannot land due to stormy weather!!
	from /Users/elmo/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):7
	from /Users/elmo/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :008 > airport.land(plane)
 => [#<Plane:0x007f9c4c90b3d0 @taken_off=false, @landed=true>]
2.4.0 :009 > plane1 = Plane.new
 => #<Plane:0x007f9c4c8dafc8 @taken_off=false, @landed=false>
2.4.0 :010 > airport.land(plane1)
RuntimeError: Cannot land due to stormy weather!!
	from /Users/elmo/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):11
	from /Users/elmo/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :011 > airport.land(plane1)
 => [#<Plane:0x007f9c4c90b3d0 @taken_off=false, @landed=true>, #<Plane:0x007f9c4c8dafc8 @taken_off=false, @landed=true>]
2.4.0 :012 > airport.land(plane1)
 => "Plane #<Plane:0x007f9c4c8dafc8> already landed!"
2.4.0 :013 > airport.take_off(plane1)
 => #<Plane:0x007f9c4c8dafc8 @taken_off=true, @landed=false>
2.4.0 :014 > airport.take_off(plane1)
RuntimeError: Cannot take off due to stormy weather!!
	from /Users/elmo/airport_challenge/lib/airport.rb:28:in `take_off'
	from (irb):15
	from /Users/elmo/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :015 > airport.take_off(plane1)
RuntimeError: Cannot take off due to stormy weather!!
	from /Users/elmo/airport_challenge/lib/airport.rb:28:in `take_off'
	from (irb):16
	from /Users/elmo/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :016 > airport.take_off(plane1)
 => "Plane #<Plane:0x007f9c4c8dafc8> already taken off!"

```

## Features

* Features
  * Plane status
  * Plane landing
  * Plane takeoff
  * Storms prevent landing
  * Storms prevent takeoff
  * Full airport cannot land planes
  * Variable and default capacity
  * Errors raised for inconsistent actions


## Demo
Here is a working live demo :  


## Site

### Landing Page
Currently it is working on all NSE (India) Stocks, BSE (India) Stocks Symbol will be added soon.


## [Usage]

### Development
Want to contribute? Great!

To fix a bug or enhance an existing module, follow these steps:

- Fork the repo
- Create a new branch (`git checkout -b improve-feature`)
- Make the appropriate changes in the files
- Add changes to reflect the changes made
- Commit your changes (`git commit -am 'Improve feature'`)
- Push to the branch (`git push origin improve-feature`)
- Create a Pull Request

### Bug / Feature Request

If you find a bug (the website couldn't handle the query and / or gave undesired results), kindly open an issue [here](https://github.com/iharsh234/WebApp/issues/new) by including your search query and the expected result.

If you'd like to request a new function, feel free to do so by opening an issue [here](https://github.com/iharsh234/WebApp/issues/new). Please include sample queries and their corresponding results.


## Built with

- [jQuery - Ajax](http://www.w3schools.com/jquery/jquery_ref_ajax.asp) - jQuery simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development.
- [Google Chart API](https://developers.google.com/chart/interactive/docs/quick_start) - Free , Rich Gallery , Customizable and Cross-browser compatible.


## To-do
Current Coverage:  94.27% -- 148/157 lines in 6 files

+----------+----------------------+-------+--------+------------------+
| coverage | file                 | lines | missed | missing          |
+----------+----------------------+-------+--------+------------------+
|  76.67%  | lib/airport.rb       | 30    | 7      | 19-20, 28-31, 33 |
|  97.40%  | spec/airport_spec.rb | 77    | 2      | 76-77            |
+----------+----------------------+-------+--------+------------------+
4 file(s) with 100% coverage not shown
