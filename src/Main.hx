package;

import haxe.io.Path;

class Main {
	static function main() {
		if (Sys.systemName() != "Windows") {
			var tools = [
				Path.join([Sys.getCwd(), "Tools", "iojs", "iojs"]),
				Path.join([Sys.getCwd(), "Tools", "oggenc"]),
				Path.join([Sys.getCwd(), "Kore", "Tools", "kfx", "kfx"]),
				Path.join([Sys.getCwd(), "Kore", "Tools", "kraffiti", "kraffiti"])
			];
			for (tool in tools) chmod(tool);
		}

		var io = Path.join([Sys.getCwd(), "Tools", "iojs", "iojs" + sysExt()]);

		var args = Sys.args();
		args.unshift(Path.join([Sys.getCwd(), "Tools", "khamake", "khamake.js"]));

		var project = Path.normalize(args.pop());
		args.push("from=" + project);
		args.push("to=" + Path.join([project, "build"]));
		args.push("haxe=" + haxePath());
		args.push("kha=" + Path.normalize(Sys.getCwd()));

		if (Sys.systemName() == "Windows")
			Sys.exit(Sys.command('"' + io + '"', args));
		else
			Sys.exit(Sys.command(io, args));
	}

	private static function chmod(path: String): Void {
		Sys.command("chmod", ["a+x", path + sysExt()]);
	}

	private static function haxePath(): String {
		var path = Sys.getEnv("HAXEPATH");
		if (path == null) path = "/usr/lib/haxe";
		return Path.normalize(path);
	}

	private static function sysExt(): String {
		switch (Sys.systemName()) {
		case "Linux":
			return "-linux";
		case "Windows":
			return ".exe";
		case "Mac":
			return "-osx";
		default:
			return "";
		}
	}
}
