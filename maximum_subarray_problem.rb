array = [2, 1, −3, 4, −1, 2, 1, −5, 4]

def max_sub_arr(array)
  find_max_of all_sub_arrays(array)
end

def all_sub_arrays(array)
  all_sub_arrays = []
  dup_array = array.dup
  index = 0

  array.map do |sub|
    dup_array.length.times do |n|
      end_index = n
      all_sub_arrays << dup_array[0..end_index]
    end
    index += 1
    dup_array.shift
  end
  all_sub_arrays
end

def find_max_of(array)
  largest_sub = array[0]
  largest_sum = largest_sub.inject(&:+)
  array.each do |sub|
    current_sum = sub.inject(&:+)
    largest_sub, largest_sum = sub, current_sum if  current_sum > largest_sum
  end
end

[4, −1, 2, 1] == max_sub_arr[array

6 == max_sub_arr(array).inject(&:+)


take your array

placeholder_array = []

push the element