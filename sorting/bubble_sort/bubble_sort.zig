const std = @import("std");

fn swapArrayElements(first_element: *i64, second_element: *i64) void {
    var tmp: i64 = first_element.*;
    first_element.* = second_element.*;
    second_element.* = tmp;
}

fn bubbleSort(unsorted_array: []i64) void {
    var changed_in_iteration: bool = false;

    for (0..unsorted_array.len - 1) |i| {
        changed_in_iteration = false;
        for (0..unsorted_array.len - i - 1) |j| {
            if (unsorted_array[j] > unsorted_array[j + 1]) {
                swapArrayElements(&unsorted_array[j], &unsorted_array[j + 1]);
                changed_in_iteration = true;
            }
        }
        if (changed_in_iteration == false) {
            break;
        }
    }
}

test "expect bubbleSort to correctly sort array" {
    var values = [_]i64{ 450, 50, 250, 60 };
    bubbleSort(&values);
    try std.testing.expect(std.mem.eql(i64, &values, &[_]i64{ 50, 60, 250, 450 }));
}
