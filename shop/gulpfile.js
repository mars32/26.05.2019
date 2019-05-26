let gulp = require('gulp'); // подключаем GULP
let concat = require('gulp-concat'); // подключаем concat
let importCss = require('gulp-import-css');
var cssimport = require("gulp-cssimport"); // gплагин компиляции стилей в один css файл, из всех импортов( @import ) вп указаном файле.
let cleanCSS = require('gulp-clean-css');  //плагин оптимизации css кода
let watch = require('gulp-watch'); // плагин следит за изменениями в указанных файлай в риалтам.
let autoprefixer = require('gulp-autoprefixer')
let watchPaths = ('styles/blocks/**/*.css');


// 1.Создаем функцию generateStyles где...

function generateStyles() {
    return gulp.src('styles/style.css')              // указываем путь откуда взять файлы
        .pipe(cssimport())                           // применяем плагины 
        .pipe(autoprefixer({
            browsers: ['last 3 versions'],          // настройки под последние 2 версии браузера
            cascade: false
        })) 
        .pipe(cleanCSS({compatibility: 'ie8'}))          
        .pipe( gulp.dest('styles/dest') ) ;          // указываем куда поместить результат
        
    };

gulp.task('styles', generateStyles);  //задаем задачу styles  с функцией generateStyles


gulp.task('watch', function() {
    gulp.watch( watchPaths , generateStyles );
    
 });

