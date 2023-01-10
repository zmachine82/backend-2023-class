puts "WOW"

# frozen_string_literal: true


# RSpec.describe Start do
  
# end


names = ["slim", "kyle", "gabe", "trevor", "chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach",
    "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach",
"heath", "kyle", "gabe", "trevor", "Chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach",
"heath", "kyle", "gabe", "trevor", "chris", "riley", "zach", "heath", "kyle", "gabe", "trevor", "chris", "riley", "zach", ]


def calculate_names(names = [])
    hash_boi = Hash.new(0)
    names.each do |name|
       name = name.capitalize
        if name != nil
            hash_boi[name] += 1
        end
    end
    return hash_boi
end



puts calculate_names names
