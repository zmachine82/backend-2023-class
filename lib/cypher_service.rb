require_relative "./cypher"

class CypherService
    def encode(msg, key)
        Cypher.new.encode(msg, key)
    end

    def encode_to_file(msg, key, path)
        message = encode(msg, key)
        File.open(path, "w+") { |file| file.write(message) }
    end

    def decode(msg, key)
        Cypher.new.decode(msg, key)
    end

    def decode_to_file(path, key)
        result = File.read(path)
        message = decode(result, key)
    end
end






