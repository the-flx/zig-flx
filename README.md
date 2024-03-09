[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Release](https://img.shields.io/github/tag/jcs090218/zig-flx.svg?label=release&logo=github)](https://github.com/jcs090218/zig-flx/releases/latest)

# zig-flx
> Zig bindings for flx-c

## 🔧 Usage

```zig
const std = @import("std");
const flx = @import("flx");

pub fn main() !void {
    const result = flx.score("switch-to-buffer", "stb");
    std.debug.print("Score: {s}", .{result.*.score});
}
```

## Installation

1. Add the dependency to the `build.zig.zon` of your project.

```zig
.dependencies = .{
        .flx = .{
            .url = "https://github.com/jcs090218/zig-flx/archive/04a1a9c4ec68ca41542e0b89af742f0d448affd4.tar.gz",
            .hash = "1220337a24d3dcb5420693aa4245a6da4cc09ec8066b162c6e19ec92e43057066839",
        },
    },
```

2. Add the dependency and module to your `build.zig`.

```zig
const flx_dep = b.dependency("flx", .{});
const flx_mod = flx_dep.module("flx");
exe.addModule("flx", flx_mod);
```

3. Import it inside your project.

```zig
const flx = @import("flx");
```

## ⚜️ License

`zig-flx` is distributed under the terms of the MIT license.

See [LICENSE](./LICENSE) for details.


<!-- Links -->

[flx]: https://github.com/lewang/flx
[flx-rs]: https://github.com/jcs090218/flx-rs
[FlxCs]: https://github.com/jcs090218/FlxCs
[flx-ts]: https://github.com/jcs090218/flx-ts
[flx-c]: https://github.com/jcs090218/flx-c
