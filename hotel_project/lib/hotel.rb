require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each_key do |roomName|
            @rooms[roomName] = Room.new(hash[roomName])
        end
    end

    def name
        nameSplit = @name.split(" ") 
        nameSplit.map!{|word| word.capitalize + " "}
        x = nameSplit.join("")
        return x[0..-2]
    end

    def rooms
        @rooms 
    end

    def room_exists?(name)
        if @rooms.has_key?(name)
            return true
        else
            return false
        end
    end

    def check_in(person, roomName)
        if !room_exists?(roomName)
            p 'sorry, room does not exist'
        else
            if @rooms[roomName].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        @rooms.each_value do |val|
            if val.available_space > 0
                return true
            end
        end
        return false
    end

    def list_rooms
        @rooms.each do |key, val|
            print key.to_s + ".*" + val.available_space.to_s + "\n"
        end
    end

            



end
