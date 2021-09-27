Airport Challenge

The aim of this project was to write a piece of software that allows a plane to take off and land in an airport in various weather conditions. This software also has the ability to be adapted depending on the size of the airport.

The initialize method allows you to set the size of the airport hangar or a deafault capacity of 2 is given if no value is set.

The hangar and capacity values are accessible throughout the code via attribute readers.

The land plane method has an if statement with two conditions. If the hangar has space to push another plane and if the random number that is generated returns a value which is attributed to a clear weather type, then a plane can land in the hangar.

The take off plane method has one condition. A random number is generated and if this number is attributed to a clear weather type then a plane can take off and be removed from the hangar.

Tests have been written for each method and can be ran by running 'rspec' in your terminal. Please note, you have to be in the 'airport_challenge' directory to run these tests.

Credits:
Hassan Saleem
Assistance provided by Steve Jones and Roi Driscoll