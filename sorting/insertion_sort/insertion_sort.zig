const std = @import("std");

fn swapArrayElements(first_element: *i64, second_element: *i64) void {
    var tmp: i64 = first_element.*;
    first_element.* = second_element.*;
    second_element.* = tmp;
}

fn insertionSort(unsorted_array: []i64) void {
    var j: u64 = 0;
    for (1..unsorted_array.len) |i| {
        j = i;
        while (j > 0 and unsorted_array[j - 1] > unsorted_array[j]) {
            swapArrayElements(&unsorted_array[j - 1], &unsorted_array[j]);
            j -= 1;
        }
    }
}

test "expect insertionSort to correctly sort array" {
    var values = [_]i64{ 450, 50, 250, 60 };
    insertionSort(&values);
    try std.testing.expect(std.mem.eql(i64, &values, &[_]i64{ 50, 60, 250, 450 }));
}
