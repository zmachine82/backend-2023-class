require_relative "./lib/cypher_service"

command = ARGV[0]

if command == 'encode'
    puts CypherService.new.encode(ARGV[1], Integer(ARGV[2]) )
end




