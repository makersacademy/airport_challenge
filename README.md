# Airport Challenge #

The client request to have a software to control the flow of planes at an airport.<br/>
The planes are allow to land and take off only if the weather is sunny.Sometimes it can be stormy, which make the land and take_off of the planes not allowed.<br/>
Also, the planes cannot take_off if they are already flying and cannot land if they are already landed.<br/>
The planes can take_off only from the airport they are in, and should be in an airport when they are landed.<br/>
An airport as a certain capacity which have to be respected. So if an airport is full, no plane is allowed to land.<br/>

Based on the user story, I have decided to create 4 classes and 1 module :<br/>

1. The class Weather, which is having 2 constants for sunny and stormy weather.<br/>
This class has 2 methods, one which randomly give a forecast and one which is checking if the weather is sunny or not.<br/>

2. The class Plane, inside of which I will check if the plane state is flying or landed.<br/>

3. The class Airport, which is taking 3 parameters : name, capacity and landed_planes, which will allow to create an airport instance with a name, a capacity to respect and the number of planes already in.<br/>
In this class I am checking the landing_possibility.<br/>

4. Finally, I have created a file where all the previous classes are required. And I have created a general module System, which is wrapping the SystemControl class.<br/>
This class takes 3 parameters. The airport_origin, the airport_destination and the plane.<br/>
The airport_origin and airport_destination objects are instances of the Airport class.<br/>
The plane object is an instance of the Plane class.<br/>
This class also needs the instance variable weather which is an instance of the Weather class.<br/>
Then check if the planes can land or not and take_off or not based on the weather, plane state and origin and destination airport.<br/>
The action of land or take off will also inside of each method change the number of planes landed in the airports every times that one or this other method will be called.

All the tests have been been written before to build the code

## How to use ##

1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want the cloned directory to be<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone https://github.com/your-username/your-repositary.git
```

2. On your local machine go inside of the *airport_challenge* directory :

```shell
$ cd airport_challenge
```
3. To install all the *gems* contained in the *Gemfile*, intall and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```

4. You can see the differents directories, with the `ls` command. If you want to see all the *.rb* files built for the challenge, go inside of the *lib* directory :

```shell
$ cd lib
```
Or if you want to see all the tests built for all the code, go inside of the *sepc* directory :

```shell
$ cd lib
```

5. You can open the *.rb* file that you wanted to read and change the code in your text editor or using `vim` :

```shell
$ vim wanted_file.rb
```
Or you can just read the contains of it from the command line with `cat` :

```shell
$ cat wanted_file.rb
```
6. Check that the codes are passing the tests by going back to the root *airport_challenge* directory and by running the *spec*.<br/>
You can check all the code files in one time :

```shell
$ cd airport_challenge
$ rspec
```
You can check only one code file at a time :

```shell
$ cd airport_challenge
$ rspec spec/file_name_spec.rb
```

7. Check that the code respect the quality of the *Rubocop* guideline, by running `rubocop` from the *airport_challenge* directory :

```shell
$ cd airport_challenge
$ rubocop
```
