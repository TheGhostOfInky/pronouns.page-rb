require "colorize"
require_relative "PronounPage"

if ARGV.length() == 2
    thisUser = PronounPage.new(ARGV[0],ARGV[1])
    print "Username: ".red, thisUser.username.yellow, "\n"
    print "Avatar: ".red, thisUser.avatar.yellow
    print "\nNames:\n".red
    thisUser.names.each do |key,value|
        print key.to_s.green, ", ".green, value.yellow, "\n"
    end
    print "\nPronouns:\n".red
    thisUser.pronouns.each do |key,value|
        print key.to_s.green, ", ".green, value.yellow, "\n"
    end
    print "Description: ".red, thisUser.description.yellow, "\nLinks:\n".red
    thisUser.links.each do |i|
        print i.yellow, "\n"
    end
    print "Age:".red, thisUser.age.to_s.yellow, "\nFlags:\n".red
    thisUser.flags.each do |i|
        print i.yellow, "\n"
    end
    print "\nWords:\n".red
    thisUser.words.each do |key,value|
        print key.to_s.green, ", ".green, value.yellow, "\n"
    end
else 
    print "Invalid input, correct syntax is 'ruby cli.rb username lang'"
end