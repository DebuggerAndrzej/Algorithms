const std = @import("std");

fn swapArrayElements(first_element: *i64, second_element: *i64) void {
    var tmp: i64 = first_element.*;
    first_element.* = second_element.*;
    second_element.* = tmp;
}

fn selectionSort(unsorted_array: []i64) void {
    var minimum_value_index: u64 = 0;

    for (0..unsorted_array.len - 1) |i| {
        minimum_value_index = i;
        for (i + 1..unsorted_array.len) |j| {
            if (unsorted_array[j] < unsorted_array[minimum_value_index]) {
                minimum_value_index = j;
            }
        }
        if (minimum_value_index != i) {
            swapArrayElements(&unsorted_array[minimum_value_index], &unsorted_array[i]);
        }
    }
}

test "expect selectionSort to correctly sort array" {
    var values = [_]i64{ 450, 50, 250, 60 };
    selectionSort(&values);
    try std.testing.expect(std.mem.eql(i64, &values, &[_]i64{ 50, 60, 250, 450 }));
}
