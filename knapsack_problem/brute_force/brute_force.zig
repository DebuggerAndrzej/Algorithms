const std = @import("std");

fn bruteKnapSack(remaining_capacity: u64, weights: []u64, values: []u64, iteration: u64) u64 {
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

test bruteKnapSack {
    const capacity: u64 = 50;
    var weights = [_]u64{ 10, 15, 40, 30 };
    var values = [_]u64{ 60, 50, 250, 450 };

    try std.testing.expect(bruteKnapSack(capacity, &weights, &values, weights.len) == 510);
}
