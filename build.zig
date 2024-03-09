const std = @import("std");

const CFlags = &.{};

fn declare_module(b: *std.Build) void {
    const module = b.addModule("flx", .{
        .source_file = .{ .path = "src/flx.zig" },
    });
    module.addIncludePath(.{ .path = "c-lib/flx-c/include/" });
    module.addCSourceFile(.{
        .file = .{
            .path = "src/stb_ds.c", // single-file header
        },
        .flags = CFlags,
    });
    module.addCSourceFile(.{
        .file = .{
            .path = "c-lib/flx-c/src/flx.c",
        },
        .flags = CFlags,
    });
    module.linkLibC();
}

fn rest(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const lib = b.addStaticLibrary(.{
        .name = "flx",
        .root_source_file = .{ .path = "src/flx.zig" },
        .target = target,
        .optimize = optimize,
    });
    lib.addIncludePath(.{ .path = "c-lib/flx-c/include/" });
    lib.addCSourceFile(.{
        .file = .{
            .path = "src/stb_ds.c", // single-file header
        },
        .flags = CFlags,
    });
    lib.addCSourceFile(.{
        .file = .{
            .path = "c-lib/flx-c/src/flx.c",
        },
        .flags = CFlags,
    });
    lib.linkLibC();

    b.installArtifact(lib);

    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/flx.zig" },
        .target = target,
        .optimize = optimize,
    });
    main_tests.addIncludePath(.{ .path = "c-lib/flx-c/include/" });
    main_tests.addCSourceFile(.{
        .file = .{
            .path = "src/stb_ds.c", // single-file header
        },
        .flags = CFlags,
    });
    main_tests.addCSourceFile(.{
        .file = .{
            .path = "c-lib/flx-c/src/flx.c",
        },
        .flags = CFlags,
    });
    main_tests.linkLibC();

    const run_main_tests = b.addRunArtifact(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_main_tests.step);
}

pub fn build(b: *std.Build) void {
    declare_module(b);
    rest(b);
}
