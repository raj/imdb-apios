# ImdbApios

Ruby IMDB client using the IMDB json web service made available for their iOS app.
Largely inspired by [imdb-pie](https://github.com/richardasaurus/imdb-pie "imdb-pie") in python

## API Terminology

- `Title` this can be a movie, tv show, video, documentary etc.
- `Name` this can be a credit, cast member, any person generally.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imdb_apios'
```

And then execute:

```bash
    $ bundle
```

Or install it yourself as:

```bash
    $ gem install imdb_apios
```

Or install it from source:

```bash
gem 'imdb_apios', :git => 'https://github.com/raj/imdb-apios'
```

## Usage


### Initialise the client
```ruby
require 'imdb_apios'
@client = ImdbApios::Client.new
```

### Available methods

NOTE: For each client method, if the resource cannot be found they will raise `StandardError`

Example | Description
--------- | ---------
`get_title('tt0111161')` | Returns a json containing title information
`search("The Dark Knight")` | Returns a json of results
`search("Christian Bale")` | Returns a json of results
`title_exits('tt0111161')` | Returns True if exists otherwise False
`get_title_genres('tt0303461')` | Returns a json containing title genres information
`get_title_credits('tt0303461')` | Returns a json containing title credits information
`get_title_quotes('tt0303461')` | Returns a json containing title quotes information
`get_title_ratings('tt0303461')` | Returns a json containing title ratings information
`get_title_connections('tt0303461')` | Returns a json containing title connections information
`get_title_similarities('tt0303461')` | Returns a json containing title similarities information
`get_title_videos('tt0303461')` | Returns a json containing title videos information
`get_title_news('tt0303461')` | Returns a json containing news
`get_title_trivia('tt0303461')` | Returns a json containing trivia
`get_title_soundtracks('tt0303461')` | Returns a json containing soundtracks information
`get_title_goofs('tt0303461')` | Returns a json containing "goofs" and teaser information
`get_title_technical('tt0303461')` | Returns a json containing technical information
`get_title_companies('tt0303461')` | Returns a json containing information about companies related to title
`get_title_episodes('tt0303461')` | Returns a json containing season and episodes information
`get_title_episodes_detailed(imdb_id='tt0303461', season=1)` | Returns a json containing detailed season episodes information
`get_title_plot('tt0111161')` | Returns a json containing title plot information
`get_title_plot_synopsis('tt0111161')` | Returns a json containing title plot synopsis information
`get_title_awards('tt0111161')` |Returns a json containing title plot information
`get_title_releases('tt0111161')` | Returns a json containing releases information
`get_title_versions('tt0111161')` | Returns a json containing versions information (meaning different versions of this title for different regions, or different versions for DVD vs Cinema)
`get_title_user_reviews('tt0111161')` | Returns a json containing user review information
`get_title_metacritic_reviews('tt0111161')` | Returns a json containing metacritic review information
`get_title_images('tt0111161')` | Returns a json containing title images information
`get_name('nm0000151')` | Returns a json containing person/name information
`get_name_filmography('nm0000151')` | Returns a json containing person/name filmography information
`get_name_images('nm0000032')` | Returns a json containing person/name images information
`get_name_videos('nm0000032')` | Returns a json containing person/name videos information
`validate_imdb_id('tt0111161')` | Return false if not valid 
`get_popular_titles()` | Returns a json containing popular titles information
`get_popular_shows()` | Returns a json containing popular tv shows
`get_popular_movies()` | Returns a json containing popular movies 


## Requirements

    1. Ruby 2

## Running the tests

```bash
bundle
rake spec
```

## example 

```bash
require 'imdb_apios'
@client = ImdbApios::Client.new
@client.search("Katrina Kaif")['d']

=> [
  {"l"=>"Katrina Kaif", "id"=>"nm1229940", "s"=>"Actress, Zindagi Na Milegi Dobara (2011)", "i"=>["https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwODY3NzA3NF5BMl5BanBnXkFtZTcwNTEzNDg3OA@@._V1_.jpg", 1266, 1767]}, 
  {"l"=>"Katrina Kroetch", "id"=>"nm6009562", "s"=>"Actress, 13 Reasons Why (2017)", "i"=>["https://images-na.ssl-images-amazon.com/images/M/MV5BYWFkMDU0NzEtM2Y1Zi00ZTZjLWI1NjAtYWEwMDc1ZTI1ZWYzXkEyXkFqcGdeQXVyNDc0NzM1MjE@._V1_.jpg", 3840, 5760]}, {"l"=>"Katrina Kemp", "id"=>"nm4320986", "s"=>"Actress, Faking It (2014-2015)", "i"=>["https://images-na.ssl-images-amazon.com/images/M/MV5BMTg3MzA2ODk3N15BMl5BanBnXkFtZTgwOTc2MzcwMzE@._V1_.jpg", 640, 640]}, {"l"=>"Katrina Kavanaugh", "id"=>"nm7771701", "s"=>"Actress, Longmire (2013)", "i"=>["https://images-na.ssl-images-amazon.com/images/M/MV5BNmVhYzMwYTQtODlhMi00ZGE5LTk2ZGYtZGUyMGUyNTMzYzAwXkEyXkFqcGdeQXVyNjEyODUyNjg@._V1_.jpg", 556, 695]}, {"l"=>"Katrina Kat", "id"=>"nm3698859", "s"=>"Actress, Imprecation (2009)"}, {"l"=>"Kathimerina kai apla", "id"=>"tt7549998", "s"=>"Elsa Poimenidou, Haris Arvanitidis", "y"=>2017, "q"=>"TV series"}, {"l"=>"Horumaika: Tebori Nakayama zuidou no kiroku", "id"=>"tt2066892", "y"=>2005, "q"=>"feature"}, 
  {"l"=>"Katrina Kane", "id"=>"nm0437365", "s"=>"Editorial Department, The Experiment (2010)"}
  ]

```


### TODO


- [ ] credentials must not be reload on each request




## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/raj/imdb_apios. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

