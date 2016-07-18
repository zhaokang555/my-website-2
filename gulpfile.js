
/**
 * File Name: gulpfile.js
 */

// 引入 gulp
var gulp = require('gulp'); 

// 引入组件
// 保证在当前项目目录下曾经运行过：
// npm install gulp-jshint gulp-concat gulp-uglify gulp-rename gulp-babel babel-preset-es2015 ...... --save-dev
var jshint = require('gulp-jshint');
var babel = require("gulp-babel");
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var stylus = require('gulp-stylus');

gulp.task('coffee', function() {
  gulp.src('./src/script/*.coffee')
      .pipe(coffee({bare: true}).on('error', gutil.log))
      .pipe(babel({presets: ['es2015']}))
      .pipe(concat('all.js'))
      // .pipe(rename('all.js'))
      .pipe(gulp.dest('./public')) // distribution
      .pipe(uglify())
      .pipe(rename('all.min.js'))
      .pipe(gulp.dest('./public')); // distribution
});

gulp.task('stylus', function () {
  gulp.src('./src/style/*.styl')
      .pipe(stylus())
      .pipe(gulp.dest('./public/'));
});

// // 语法检查
// gulp.task('jshint', function() {
//   gulp.src('./js/*.js')
//   .pipe(jshint())
//   .pipe(jshint.reporter('default'));
// });

// 监视文件的变化
gulp.task('watch', ['coffee', 'stylus'], function(){
  gulp.watch('./src/script/*.coffee', ['coffee'])
  gulp.watch('./src/style/*.styl', ['stylus'])
});

// 默认任务
gulp.task('default', ['coffee', 'stylus', 'watch']);
