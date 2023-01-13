# puts "WOW"


# names = ["slim", "kyle", "gabe", "trevor", "chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach",
#     "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach",
# "heath", "kyle", "gabe", "trevor", "Chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach",
# "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach", ]


# def calculate_names(names = [])
#     hash_boi = Hash.new(0)
#     names.each do |name|
#        name = name.capitalize
#         if name != nil
#             hash_boi[name] += 1
#         end
#     end
#     return hash_boi
# end



# puts calculate_names names


require_relative "./lib/cypher"

cypher = Cypher.new

# encoded_msg = cypher.encode("Wow, A really cool message that definitely works! and the code is great too!", 6)
# File.open("secret.txt", "w") {|f| f.write(encoded_msg) }
# puts cypher.decode(encoded_msg, 6)

puts cypher.decode(File.read("secret.txt"), 3)