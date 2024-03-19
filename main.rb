class HashMap
    def initialize 
        @buckets = Array.new(10) { [] } # Initialize an array of empty buckets
        @size = 0 #Initialize the number of elements
        @threshold = 0.75 #Set the load factor threshold
    end

    def hash(key)
        #takes a key and produces a hash code
        hash_code = 0
        prime_number = 31
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        # p hash_code
        hash_code
    end

    def set(key,value)
        hash_code = hash(key)
        bucket_index = hash_code % @buckets.length # Determine the bucket index
        p "#{key} will be put in bucket index: #{bucket_index}"

        bucket = @buckets[bucket_index]
        found_key_index = bucket.index { |pair| pair[0] == key }

        if found_key_index
            #if key already exists, update value
            bucket[found_key_index][1] = value
        else
            # Key does not exist, add key-value pair
            bucket << [key,value]
            @size += 1 #Increment the number of elements
            resize_buckets if @size >= @threshold * @buckets.length #check if resizing is needed
        end
        # p @buckets
    end

    def resize_buckets
        new_buckets_size = @buckets.length * 2 #double the size of the array of the buckets
        new_buckets = Array.new(new_buckets_size) { [] }
        @buckets.each do |bucket|
            bucket.each do |pair|
                new_hash_code = hash(pair[0])
                new_bucket_index = new_hash_code % new_bucket_size
                new_bucket_size
                new_buckets[new_bucket_index] << pair
            end
        end
        @buckets = new_buckets
    end

    def get(key)
        #returns the value that is assigned to this key. If key is not found, return nil.
        hash_code = hash(key)
        bucket_index = hash_code % @buckets.length
        bucket = @buckets[bucket_index]
        pair = bucket.find {|pair| pair[0] == key }
        pair ? pair[1] : nil
    end

    def has(key)
        #returns true or false based on whether or not the key is in the hash map
        hash_code = hash(key)
        bucket_index = hash_code % @buckets.length
        bucket = @buckets[bucket_index]
        !!bucket.find { |pair| pair[0] == key } #.find returns the matching pair, use the !! to convert it to boolean value
    end

    def remove(key)
        #If the given key is in the hash map, it should remove the entry with that key and return the deleted entry’s value. If the key isn’t in the hash map, it should return nil.
        hash_code = hash(key)
        bucket_index = hash_code % @buckets.length
        bucket = @buckets[bucket_index]
        pair_index = bucket.index {|pair| pair[0] == key }
        if pair_index
            removed_pair = bucket.delete_at(pair_index)
            @size -= 1
            removed_pair #return the removed_pair key-value
        else
            nil
        end
    end

    def length
        #returns the number of stored keys in the hash map
        @size
    end

    def clear
        #removes all entries in the hash map
    end

    def keys
        #returns an array containing all the keys inside the hash map

    end

    def values
        #returns an array containing all the values
    end

    def entries
        #returns an array that contains each key, value pair. Example: [[first_key, first_value], [second_key, second_value]]
    end

end

#Extra Credit
#Create a class HashSet that behaves the same as a HashMap but only contains keys with no values.

class HashSet
    def hash(key)
        #takes a key and produces a hash code
        hash_code = 0
        prime_number = 31
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        hash_code
    end

    def set(key)
        #if key already exists, update value

    end

    def get(key)
        #returns the value that is assigned to this key. If key is not found, return nil.
    end

    def has(key)
        #returns true or false based on whether or not the key is in the hash map
    end

    def remove(key)
        #If the given key is in the hash map, it should remove the entry with that key and return the deleted entry’s value. If the key isn’t in the hash map, it should return nil.
    end

    def length
        #returns the number of stored keys in the hash map
    end

    def clear
        #removes all entries in the hash map
    end

    def keys
        #returns an array containing all the keys inside the hash map
    end

    def values
        #returns an array containing all the values
    end

    def entries
        #returns an array that contains each key, value pair. Example: [[first_key, first_value], [second_key, second_value]]
    end
end

#TESTING
mHash = HashMap.new
mHash.set('Hermione', 'Gryffindor')
mHash.set('Ron', 'Gryffindor')
puts "Hash size is #{mHash.length}."

puts "Getting Ron: #{mHash.get('Ron')}"
puts "Getting Severus: #{mHash.get('Severus')}"

mHash.set('Draco', 'Slytherin')
puts "Hash size is #{mHash.length}."
puts "Has Hermione?: #{mHash.has('Hermione')}"
puts "Has Luna?: #{mHash.has('Luna')}"

mHash.set('Luna', 'Ravenclaw')
mHash.set('Cedric', 'Hufflepuff')
puts "Hash size is #{mHash.length}."

puts "Removing #{mHash.remove('Ron')} from the hashmap."
puts "Hash size is #{mHash.length}."