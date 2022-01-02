require_relative "PronounPage"

if ARGV.length() == 2
    thisUser = PronounPage.new(ARGV[0],ARGV[1])
    print "Username: ", thisUser.username, "\n"
    print "Avatar: ", thisUser.avatar
    print "\nNames:\n"
    thisUser.names.each do |i|
        i.each do |key,value|
            print key.to_s, ", ", value, "\n"
        end
    end
    print "\nPronouns:\n"
    thisUser.pronouns.each do |i|
        i.each do |key,value|
            print key.to_s, ", ", value, "\n"
        end
    end
    print "Description: ", thisUser.description, "\nLinks:\n"
    thisUser.links.each do |i|
        print i, "\n"
    end
    print "Age:", thisUser.age, "\nFlags:\n"
    thisUser.flags.each do |i|
        print i, "\n"
    end
    print "\nWords:\n"
    thisUser.words.each do |i|
        i.each do |key,value|
            print key.to_s, ", ", value, "\n"
        end
    end
else 
    print "Invalid input, correct syntax is 'ruby cli.rb username lang'"
end