fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def bubble_sort!(array, &prc)
  prc ||= Proc.new{|x, y| x.length <=>y.length}

  sorted = false
  until sorted
    sorted = true
    array.each_index do |i|
    next if i + 1 == array.length
        j = i + 1
      if prc.call(array[i], array[j]) == 1
        sorted = false
        array[i], array[j] = array[j], array[i]
      end
    end
  end
  array.last
end


class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|x, y| x <=> y}
    return self if length <= 1
    mid = length / 2
    left_sorted = self.take(mid).merge_sort(&prc)
    right_sorted = self.drop(mid).merge_sort(&prc)
    Array.merge(left_sorted, right_sorted, &prc)
  end

  def merge(left, right, &prc)
    prc ||= Proc.new{|x,y| x<=>y}
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end
end



def cleaver_pus(array)
  longest = 0
  fish_idx = 0
  array.each_index do |idx|
    if array[idx].length > longest
      longest = array[idx].length
      fish_idx = idx
    end
  end
  array[fish_idx]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_index do |idx|
    return idx if tiles_array[idx] == direction
  end
end

def fast_dance(direction, moves_hash)
  return moves_hash[direction]
end
