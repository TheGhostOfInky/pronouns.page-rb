class PronounPage 
    require "net/http"
    require "json"
    def initialize(name,lang)
        @lang = lang
        uri = URI("https://en.pronouns.page/api/profile/get/#{name}?version=2")
        res = Net::HTTP.get(uri)
        @data = JSON.parse(res)
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
        names = {}
        @data["profiles"][@lang]["names"].each do |i|
            names[i["value"]] = i["opinion"]
        end
        names
    end
    def pronouns
        pronouns = {}
        @data["profiles"][@lang]["pronouns"].each do |i|
            pronouns[i["value"]] = i["opinion"]
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
            flags << i["name"]
        end
        flags
    end
    def words
        words = {}
        @data["profiles"][@lang]["words"].each do |i|
            i["values"].each do |i|
                words[i["value"]] = i["opinion"]
            end
        end
        words
    end
end