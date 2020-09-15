var gulp = require("gulp"),
	sass = require("gulp-sass"),
	postcss = require("gulp-postcss"),
	babel = require('gulp-babel'),
	concat = require('gulp-concat'),
	autoprefixer = require("autoprefixer"),
	cssnano = require("cssnano"),
	rename = require("gulp-rename"),
	fileinclude = require('gulp-file-include'),
	uglify = require('gulp-uglify');

const cssFiles = [
	'./src/scss/**/*.scss',
];

const jsFilesLibs = [
	 "node_modules/jquery/dist/jquery.min.js",
	 "node_modules/bootstrap/dist/js/bootstrap.bundle.js",
];

const jsFiles = [
	"src/js/index.js"
];

function style() {
	return (
		gulp
			.src(cssFiles)
			.pipe(sass())
			.on("error", sass.logError)
			.pipe(postcss([autoprefixer(), cssnano()]))
			.pipe(rename({
				dirname: "",
				basename: "main",
				prefix: "",
				suffix: ".min",
				extname: ".css"
			}))
			.pipe(gulp.dest("./app/css"))
	);
}

exports.style = style;


function libs() {
	return (
		gulp
		.src(jsFilesLibs)
			.pipe(concat("libs.min.js"))
			.pipe(gulp.dest("./app/js"))
	);
}

exports.libs = libs;

function js() {
	return (
		gulp
			.src(jsFiles)
				//.pipe(uglify())
				// .pipe(rename({
				// 	dirname: "",
				// 	basename: "scripts",
				// 	prefix: "",
				// 	suffix: ".min",
				// 	extname: ".js"
				// }))
			.pipe(concat("scripts.min.js"))
			.pipe(gulp.dest("./app/js"))
	);
}

exports.js = js;

function html() {
	return gulp.src('./src/**/*.html')
		.pipe(fileinclude({
			prefix: '@@',
			basepath: '@file'
		}))
		.pipe(gulp.dest('./app/'));
}

exports.html = html;

function fonts() {

	return gulp.src(['./src/fonts/**/*.*'])
		.pipe(gulp.dest('./app/fonts/'));

}

exports.fonts = fonts;


function img() {

	return gulp.src(['./src/images/**/*.*'])
		.pipe(gulp.dest('./app/images/'));

}

exports.img = img;


function watch() {

	style();
	libs();
	js();
	img();
	fonts();
	html();

	gulp.watch(cssFiles, style);
	gulp.watch(jsFilesLibs, libs);
	gulp.watch(jsFiles, js);
	gulp.watch(["./src/images/**/*.*"], img);
	gulp.watch(['./src/fonts/**/*.*'], fonts);
	gulp.watch('./src/**/*.html', html);
}

exports.watch = watch;