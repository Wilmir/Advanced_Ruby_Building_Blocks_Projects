module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
        self
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i], i)
            i += 1
        end
        self
    end

    def my_select
        array = []
        self.my_each {|element| array << element if yield(element)}
        array
    end

    def my_all?
        self.my_each { |element| r  eturn false if !(yield(element))}
        true
    end

    def my_any?
        self.my_each {|element| return true if yield(element)}
        false
    end

    def my_none?
        self.my_each {|element| return false if yield(element)}
        true
    end

    def my_count(item = nil)
        counter = 0;
        if block_given?
            self.each {|element| counter+=1 if yield(element)}
            return counter
        end

        if item
            self.each {|element| counter+=1 if item==element}
            return counter
        else
            return self.length
        end 
    
    end


    def my_map (proc = nil)
        array = []
        self.each do |element| 
            if proc
                array << proc.call(element)
            elsif block_given?    
               array << yield(element)
            end
        end
        array
    end


    def my_inject (item = nil)

        result = item ? yield(item,self.first) : self.first

        i = 1
        while i < self.length
            result = yield(result,self[i])
            i+=1
        end

        result
    end


end


###################Testings Done######################

=begin

arr = ["wilmir","rhea","jhon"]

p "Testing my_each_with_index"
p arr.each_with_index {|n,i| puts "#{i}: #{n}"}
p arr.my_each_with_index {|n,i| puts "#{i}: #{n}"}

p "Testing my_select"
p arr.select {|name| name.include?("w")}
p arr.my_select {|name| name.include?("w")}

p "Testing my_all"
p arr.all? {|name| name.is_a? String}
p arr.my_all? {|name| name.is_a? String}

p "Testing my_any"
p arr.any? {|name| name.is_a? String}
p arr.my_any? {|name| name.is_a? String}

p "Testing my_none"
p arr.none? {|name| name.is_a? Integer}
p arr.my_none? {|name| name.is_a? Integer}

p "Testing my_count"
p arr.count
p arr.my_count
p arr.count("rhea")
p arr.my_count("rhea")
p arr.count {|element| element != "rhea"}
p arr.my_count {|element| element != "rhea"}

p "Testing my_map"
p arr.map {|element| element + " " + "nicanor"}
p arr.my_map {|element| element + " " + "nicanor"}

p "Testing my_inject"
p arr.inject {|result,element| result + " " + element}
p arr.my_inject {|result,element| result + " " + element}
p arr.inject("myrna") {|result,element| result + " " + element}
p arr.my_inject("myrna") {|result,element| result + " " + element}

p "Calling my_inject in a test method"
def multiply_els (arr)
    arr.my_inject{|result,element| result*element}
end
p multiply_els([2,4,5])

p "Testing map with a Proc"
myProc = Proc.new {|element| element + " " + "nicanor"}
p arr.map(&myProc)

=end
