const std = @import("std");

const opts = @import("build_options");

pub fn resolveConfigDir(alloc: std.mem.Allocator, io: std.process.Init) ![]const u8 {
    if (opts.is_dev) {
        return io.environ_map.get("PWD") orelse return error.NoPWD;
    }

    const path_xdg = io.environ_map.get("XDG_CONFIG_HOME") orelse return error.NoConfigHome;
    _ = alloc;

    return path_xdg;
}

pub fn main(init: std.process.Init) !void {
    const alloc = init.gpa;

    const config_dir = try resolveConfigDir(alloc, init);

    var stdout_buf: [1024]u8 = undefined;
    var stdout_writer: std.Io.File.Writer = .init(.stdout(), init.io, &stdout_buf);
    const stdout = &stdout_writer.interface;

    try stdout.print("vynta config dir: {s}\n", .{config_dir});
    try stdout.flush();
}
