const {watch, series,dest, src} = require('gulp')
const sass = require("gulp-sass")(require('sass'))

function tchopa () {
    return src("index.scss").pipe(sass()).pipe(dest("css"))
}

function  watch_tchopa() {
    watch(['index.scss'], tchopa)
}

exports.default = series(tchopa, watch_tchopa)
