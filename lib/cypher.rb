class Cypher
    
    def encode(msg, deviation)
        newMsg = ""

        msg.each_byte do |character|
            character = deviation + character
            if deviation % 256 == 0
                if deviation > 0
                    character += 1
                else
                    character -= 1
                end
            end
            if character > -1

                while character > 255
                    character -= 256
                end
            else
                while character < 0
                    character += 256
                end
            end
            newMsg += character.chr
        end
        
        return newMsg
    end

    def decode(msg, deviation)
        encode(msg, -deviation)
    end
end




