# bart-ruby

## Installation

```bash
$ gem install bart-ruby
```

## Usage

```ruby
require 'bart'

# Retrieve all bart stations
stations = Bart::Station.all

# What is a Bart::Station?
station = stations.first
# => #<Bart::Station:0x00007fb3ac2f5b40 @abbreviation="12TH", @name="12th St. Oakland City Center", @latitude="37.803768", @longitude="-122.271450", @address="1245 Broadway", @city="Oakland", @county="alameda", @state="CA", @zip_code="94612">

# Retrieve real-time estimates
station.realtime_estimates

# What is a real-time estimate?
station.realtime_estimates.first
# => #<Bart::RealtimeEstimate:0x00007fb3ac34c468 @from=#<Bart::Station:0x00007fb3ac2f5b40 @abbreviation="12TH", @name="12th St. Oakland City Center", @latitude="37.803768", @longitude="-122.271450", @address="1245 Broadway", @city="Oakland", @county="alameda", @state="CA", @zip_code="94612">, @to=#<Bart::Station:0x00007fb3ac2f4ec0 @abbreviation="ANTC", @name="Antioch", @latitude="37.995388", @longitude="-121.780420", @address="1600 Slatten Ranch Road", @city="Antioch", @county="Contra Costa", @state="CA", @zip_code="94509">, @minutes="21", @platform="3", @direction="North", @length="10", @color="YELLOW", @hex_color="#ffff33", @bike_flag="1", @delay="0">
```

## Development

Install all dependencies with bundler

```bash
$ bundle
```

Run guard

```
$ bundle exec guard
```

Begin your development!
