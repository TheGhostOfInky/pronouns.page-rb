class PronounPage 
    require "net/http"
    require "json"
    def initialize(name,lang)
        @lang = lang
        @data = JSON.parse(Net::HTTP.get(URI("https://en.pronouns.page/api/profile/get/#{name}")))
        if @data["profiles"] == {}
            raise "invalid user"
        end
        unless @data["profiles"].keys.include? @lang
            raise "language not present in user"
        end
    end
    def username
        @data["username"]
    end
    def avatar
        @data["avatar"]
    end
    def names
        names = Array.new
        @data["profiles"][@lang]["names"].each do |i|
            names << {i[0] => type(i[1])}
        end
        names
    end
    def pronouns
        pronouns = Array.new
        @data["profiles"][@lang]["pronouns"].each do |i|
            pronouns << {i[0] => type(i[1])}
        end
        pronouns
    end
    def description
        @data["profiles"][@lang]["description"]
    end
    def links
        @data["profiles"][@lang]["links"]
    end
    def age
        @data["profiles"][@lang]["age"]
    end
    def flags
        flags = Array.new
        @data["profiles"][@lang]["flags"].each do |i|
            flags << i
        end
        @data["profiles"][@lang]["customFlags"].each do |i|
            flags << i[1]
        end
        flags
    end
    def words
        words = Array.new
        @data["profiles"][@lang]["words"].each do |i|
            i.each do |i|
                words << {i[0] => type(i[1])}
            end
        end
        words
    end
    private
    def type (val)
        case val
        when -1
            "Nope"
        when 0
            "Okay"
        when 1
            "Yes"
        when 2
            "Jokingly"
        when 3
            "Only if we're close"
        end
    end
end