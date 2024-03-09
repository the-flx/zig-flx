const std = @import("std");
const testing = std.testing;

const c = @cImport({
    @cInclude("stb_ds.h");
    @cInclude("flx.h");
});

pub const Result = [*c]c.flx_result;
const c_string = [*c]const u8;

export fn score(str: c_string, query: c_string) Result {
    return c.flx_score(str, query);
}

test "test score (buffer-file-name, bfn)" {
    const result: Result = score("buffer-file-name", "bfn");
    try testing.expect(result.*.score == 237);
}
