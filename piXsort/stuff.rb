Person = Struct.new(:name, :age)

person1 = Person.new('steve')

puts person1.name
person1.age= 5

puts person1.age 


class Person
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
    end

    def increase_Age(nun)
        if nun >5
            @age = nun
        end
    end
end