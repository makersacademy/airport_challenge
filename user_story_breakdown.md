user story breakdown

atc can '#land' Planes at Airports

atc can '#takeoff' Planes from Airports

atc can prevent '#takeoff' if .weather is stormy
atc can prevent '#land' if .weather is stormy

atc can prevent '#land' if Airport is .full

sd can set .capacity for Airports

ensure that planes can only take off from airports they are in;
planes that are already flying cannot takes off and/or be in an airport;
planes that are landed cannot land again and must be in an airport, etc.