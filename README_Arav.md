# Airport Challenge
This programme has been designed to help Air Traffic Controllers manage the movement of planes in the sky. The program enables the user to adjust for the different sizes of Airports by enabling the user to adjust the capacity. The program has created restrictions to prevent planes from operating during bad weather, which is hoped to reduce incidence rates at the airports.

## Motivation
This program was produced as part of the weekend challenge for my first week at Makers Academy. The program is meant to enable Air Traffic Controllers and System designers to reduce the need to model planes using paper processes.

## Framework used
* Program code is written in `ruby`
* Tests are written using `rspec`

## Features
The following features were implemented:
* Air Traffic Controllers can instruct planes to land and takeoff from airports
* Airports will automatically prevent planes from landing if the airport is full (default capacity is set to 5 planes)
* The Airport default capacity can be varied on a case by case basis
* The weather randomises
* During stormy weather both take off and landing is strictly prohibited

## Installation
This program is available in `ruby`. It requires certain `gems` to install the project:
> gem install bundle
> bundle

## How to use?
The file can be run through `irb`. Run the following code in the project working directory:
> irb -r ./lib/plane.rb
