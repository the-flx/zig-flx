const std = @import("std");
const flx = @import("flx");

pub fn main() !void {
    const result = flx.score("switch-to-buffer", "stb");
    std.debug.print("Score: {d}", .{result.*.score});
}
