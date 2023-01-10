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
