<div align="center">

<img src="docs/illustration.png" width="500px">

&nbsp;

![](https://img.shields.io/github/last-commit/arthurfincham/airportchallenge)
![](https://img.shields.io/github/languages/count/arthurfincham/airportchallenge)
![](https://img.shields.io/github/languages/code-size/arthurfincham/airportchallenge)
[![Ruby](https://badgen.net/badge/icon/ruby?icon=ruby&label)](https://https://ruby-lang.org/)


</div>

#### Install

``` bash
% git clone https://github.com/arthurfincham/airportchallenge
```

You may be prompted to install a different version of Ruby. If so...
``` bash
% rvm install 3.0.2
```

#### Usage
To play around with the program, your best bet is IRB. Go to the project directory and run:
``` bash
% irb -Ilib -rairport
```
This will require the necessary files.

Next, create an instance of the Plane class with `plane = Plane.new`. By default, the plane is already flying - don't ask how. Then, create an instance of the Airport class. The capacity of the airport is 1 plane; this can be changed by passing an integer as an argument - `airport = Airport.new(8)`.
