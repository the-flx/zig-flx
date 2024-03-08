const std = @import("std");
const testing = std.testing;

const c = @cImport({
    @cInclude("flx.h");
});

export fn score(str: [*c]const u8, query: [*c]const u8) [*c]c.flx_result {
    return c.flx_score(str, query);
}

test "test score (buffer-file-name, bfn)" {
    var result: [*c]c.flx_result = score("buffer-file-name", "bfn");
    try testing.expect(result.score == 237);
}
