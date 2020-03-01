def bubble_sort (arr)
    k = arr.length

    while k > 0
        i = 0
        while i < (k-1)
            if(arr[i+1] < arr[i])
                arr[i], arr[i+1] = arr[i+1], arr[i]
            end
            i += 1
        end
        k -= 1
    end

    arr
end


def bubble_sort_by(arr)
    k = arr.length

    while k > 0
        i = 0
        while i < (k-1)
            if(yield(arr[i],arr[i+1]) > 0)
                arr[i], arr[i+1] = arr[i+1], arr[i]
            end
            i += 1
        end
        k -= 1
    end

   arr
end

#regular bubble sort
arr = [5,4,3,2,1]
p bubble_sort(arr)

#modified bubble sort which accepts a block of code defining the method of sorting
bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length <=> right.length
end