package;

import haxe.io.Path;

class Main {
	static function main() {
		var io = Path.join([Sys.getCwd(), "Tools", "iojs", "iojs.exe"]);
		var args = Sys.args();
		args.unshift(Path.join(["Tools", "khamake", "khamake.js"]));
		Sys.exit(Sys.command(io, args));
	}
}
