const std = @import("std");
const flx = @import("flx");
const Chameleon = @import("chameleon").Chameleon;

pub fn main() !void {
    comptime var cham = Chameleon.init(.Auto);
    std.debug.print(cham.green().fmt("Hello, world!"), .{});

    //const result = flx.score("switch-to-buffer", "stb");
    //std.debug.print("hello {s}", .{result.*.score});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
