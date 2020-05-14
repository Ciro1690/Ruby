class Array
    def my_each(&prc)
        self.each do |ele|
            prc.call(ele)
        end
        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each do |ele|
            new_array << ele if prc.call(ele)
        end
        new_array
    end

    def my_reject(&prc)
        new_array = []
        self.my_each do |ele|
            new_array << ele if !prc.call(ele)
        end
        new_array
    end

    def my_any?(&prc)
        new_array = []
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end
    
    def my_all?(&prc)
        new_array = []
        self.my_each do |ele|
            return false if !prc.call(ele)
            break
        end
        true
    end

    def my_flatten
    new_array = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_array.concat(ele.my_flatten)
            else
                new_array << ele
            end
        end
        new_array
    end

    def my_zip(*args)
    new_array = []
    self.length.times do |i|
        sub = [self[i]]
        args.each do |args|
            sub << args[i]
        end
        new_array << sub
    end
    new_array
    end

    def my_rotate(n=1)
        new_array = []
        self.each_with_index do |ele,ind|
            new_array << (self[(ind+n)%self.length])
        end
        new_array
    end

    def my_join(sep = "")
        str = ""
        self.each do |ele|
            str += ele
            str += sep if self[-1] != ele
        end
        str
    end

    def my_reverse
        array = []
        i = self.length
        while i > 0
            array << self[i-1]
        i -= 1
        end
        array
    end
end
