
/**
 * File Name: gulpfile.js
 */

// 引入 gulp
var gulp = require('gulp'); 

// 引入组件
// 保证在当前项目目录下曾经运行过：
// npm install gulp-uglify gulp-rename gulp-babel babel-preset-es2015 ...... --save-dev
// var jshint = require('gulp-jshint');
var babel = require("gulp-babel");
var rename = require('gulp-rename');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var stylus = require('gulp-stylus');
var browserify = require('browserify');
// var babelify = require('babelify');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var sourcemaps = require('gulp-sourcemaps');
var notify = require('gulp-notify');

// 把src/script下的所有coffee逐个编译为js, 放在temp/script下
gulp.task('coffee', function() {
  gulp.src('./src/script/**/*.coffee')
      .pipe(coffee({bare: true}).on('error', gutil.log))
      .pipe(babel({presets: ['es2015']}))
      .pipe(gulp.dest('./temp/script'))

});

gulp.task('stylus', function() {
  gulp.src('./src/style/*.styl')
      .pipe(stylus())
      .pipe(gulp.dest('./public/'));
});

gulp.task('browserify', function() {
  browserify({
    entries: ['./temp/script/main.js'],
    debug: true, // 告知Browserify在运行同时生成内联sourcemap用于调试
  })
  // .transform("babelify", {presets: ["es2015"]})
  .bundle()
  .pipe(source('bundle.js'))
  .pipe(buffer()) // 缓存文件内容
  .pipe(sourcemaps.init({loadMaps: true})) // 从 browserify 文件载入 map
  .pipe(sourcemaps.write('.')) // 写入 .map 文件
  .pipe(gulp.dest('public'))
  .pipe(notify({ message: 'browserify task complete' }));
})

// 监视文件的变化
gulp.task('watch', ['coffee', 'browserify', 'stylus'], function(){
  gulp.watch('./src/script/**/*.coffee', ['coffee'])
  gulp.watch('./src/style/*.styl', ['stylus'])
  gulp.watch('./temp/script/*.js', ['browserify'])
});

// 默认任务
gulp.task('default', ['coffee', 'browserify', 'stylus', 'watch']);
