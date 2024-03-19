# hashmap
## The Odin Project - Ruby Course: Project: HashMap

### My personal notes: 
> Use the following snippet whenever you access a bucket through an index. We want to raise an error if we try to access an out of bound index:
```ruby
raise IndexError if index.negative? || index >= @buckets.length
```

Here, bucket index is calculated using the modulo operator (%) with the length of the array of buckets (@buckets.length), it is unnecessary to check for negative values or values greater than or equal to @buckets.length. The modulo operation ensures that the resulting bucket index will always be within the range of valid indices for the array of buckets.

> HashMap vs. HashSet in the ```has(key)``` method

```Find``` method expects a block that evaluates whether each element satisfies a condition. To check if a key exists in the bucket, use ```include?``` method to iterate over the bucket and compare each key individually.