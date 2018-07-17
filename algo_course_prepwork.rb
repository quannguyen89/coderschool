class InterviewPrepwork
  def self.checkpoint1
    return 'A'
  end

  def self.checkpoint2(n)
    size = 2 * n - 1
    arr = []
    for i in (1..size) do
      sub_arr = []
      for j in (1..size)
        sub_arr << 0
      end
      arr << sub_arr
    end

    for i in (0...size) do
      for j in (i...size-i) do
        arr[i][j] = n -i
        arr[j][i] = n -i
        arr[size-1-i][j] = n-i
        arr[j][size-1-i] = n -i
      end
    end
    arr
  end

  def self.checkpoint3_prob2(arr, from, to)
    for i in (1...arr.length) do
      arr[i] += arr[i-1]
    end
    count = 0
    for i in (0...arr.length) do
      for j in (0..i) do
        range_sum = j > 0 ? arr[i] - arr[j-1] : arr[i]
        count = count + 1 if range_sum >= from && range_sum <= to
      end
    end
    count
  end

  def self.checkpoint5_prob2(arr)
    hash = {}
    arr.each { |n| hash[n] = true }
    res = 1
    arr.each do |n|
      left = n - 1
      right = n + 1
      count = 1
      while hash[left]
        count = count + 1
        hash.delete(left)
        left = left - 1
      end
      while hash[right]
        count = count + 1
        hash.delete(right)
        right = right + 1
      end
      res = [res, count].max
    end
    res
  end
end
