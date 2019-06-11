module SortModule
  class Heapsort
    attr_reader :array_ordenado, :count

    def initialize
      @array_ordenado = []
      @count = 0
    end

    def init(array)
      heap_sort(array)
    end

    def print_sort
      puts @array_ordenado.to_s
    end

    def print_count
      puts @count.to_s
    end

    private

    def heap_sort(array)
      n = array.length
      a = [nil] + array

      (n / 2).downto(1) do |i|
        heapify(a, i, n)
      end

      while n > 1
        a[1], a[n] = a[n], a[1]
        n -= 1
        heapify(a, 1, n)
      end
      a.drop(1)

      @array_ordenado = a
    end

    def heapify(array, parent, limit)
      root = array[parent]
      while (child = 2 * parent) <= limit
        @count += 1
        child += 1 if child < limit && array[child] < array[child + 1]
        break if root >= array[child]

        array[parent] = array[child]
        parent = child
        array[parent] = root
      end
    end
  end
end
