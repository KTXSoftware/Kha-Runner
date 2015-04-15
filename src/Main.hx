package;

import haxe.io.Path;

class Main {
	static function main() {
		var io = Path.join([Sys.getCwd(), "Tools", "iojs", "iojs.exe"]);

		var args = Sys.args();
		args.unshift(Path.join([Sys.getCwd(), "Tools", "khamake", "khamake.js"]));

		var project = Path.normalize(args.pop());
		args.push("from=" + project);
		args.push("to=" + Path.join([project, "build"]));
		args.push("haxe=" + Path.normalize(Sys.getEnv("HAXEPATH")));
		args.push("kha=" + Path.normalize(Sys.getCwd()));

		Sys.exit(Sys.command('"' + io + '"', args));
	}
}
