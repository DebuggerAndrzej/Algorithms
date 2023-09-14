const std = @import("std");

fn swapArrayElements(first_element: *i64, second_element: *i64) void {
    var tmp: i64 = first_element.*;
    first_element.* = second_element.*;
    second_element.* = tmp;
}

fn partition(unsorted_array: []i64, starting_index: i64, ending_index: i64) i64 {
    var pivot: i64 = unsorted_array[@intCast(ending_index)];
    var i: i64 = starting_index - 1;

    for (@intCast(starting_index)..@intCast(ending_index)) |j| {
        if (unsorted_array[j] < pivot) {
            i += 1;
            swapArrayElements(&unsorted_array[@intCast(i)], &unsorted_array[j]);
        }
    }
    swapArrayElements(&unsorted_array[@intCast(i + 1)], &unsorted_array[@intCast(ending_index)]);
    return i + 1;
}

fn quicksort(unsorted_array: []i64, starting_index: i64, ending_index: i64) void {
    if (starting_index < ending_index) {
        var partitioning_index: i64 = partition(unsorted_array, starting_index, ending_index);
        quicksort(unsorted_array, starting_index, partitioning_index - 1);
        quicksort(unsorted_array, partitioning_index + 1, ending_index);
    }
}

test "expect quicksort to correctly sort array" {
    var values = [_]i64{ 450, 50, 250, 60 };
    quicksort(&values, 0, values.len - 1);
    try std.testing.expect(std.mem.eql(i64, &values, &[_]i64{ 50, 60, 250, 450 }));
}
