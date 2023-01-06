# Pronouns.Page-rb

### Disclaimer: I am in **no way** involved with the team behind the website, I simply wrote this wrapper as a personal project to learn Ruby.

**Pronouns.Page-rb** is an API wrapper for the [pronouns.page](https://en.pronouns.page/api) public API's Cards iterface, this repo includes a ruby class file that can be called on it own (`PronounPage.rb`), and a command line interface to it (`cli.rb`)

## Using the CLI:
To use the CLI install the latest version of ruby and run `bundle install` to install the needed JSON ruby gem, open a command prompt/terminal in the page and run: 
```
ruby cli.rb <username> <language>
```
For example, `ruby cli.rb theghostofinky en`  will return my page's info.

## Using in ruby projects

To use this wrapper in other ruby projects you once again need to have ruby and the JSON gem installed, after that you will need to `require_relative "PronounPage"` and make a new PronounPage object, for example the following code will print my Username:

```ruby
require_relative "PronounPage"

inky = PronounPage.new("theghostofinky","en")
puts inky.username
```
This wrapper provides 9 methods as follows:

- :username - string
- :avatar - string
- :names - Hash
- :pronouns - Hash
- :description - string
- :links - Array\<string\>
- :age - integer
- :flags - Array\<string\>
- :words - Hash