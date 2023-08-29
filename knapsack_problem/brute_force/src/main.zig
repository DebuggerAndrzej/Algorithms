const std = @import("std");

fn bruteKnapSack(remaining_capacity: u8, weights: []u8, values: []u16, iteration: u8) u16 {
    if (iteration == 0 or remaining_capacity == 0) {
        return 0;
    }

    if (weights[iteration - 1] > remaining_capacity) {
        return bruteKnapSack(remaining_capacity, weights, values, iteration - 1);
    } else {
        return @max( //
            values[iteration - 1] + bruteKnapSack(remaining_capacity - weights[iteration - 1], weights, values, iteration - 1), //
            bruteKnapSack(remaining_capacity, weights, values, iteration - 1) //
        );
    }
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const capacity: u8 = 50;
    var weights = [_]u8{ 10, 15, 40, 30 };
    var values = [_]u16{ 60, 50, 250, 450 };

    try stdout.print("Brute force solution value sum: {d}", .{bruteKnapSack(capacity, &weights, &values, weights.len)});
}
