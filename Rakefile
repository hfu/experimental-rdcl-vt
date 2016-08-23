task :default do
  sh "ruby geojsoncat.rb | time ../tippecanoe/tippecanoe --force --base-zoom=g --minimum-zoom=12 --maximum-zoom=14 --minimum-detail=5 --exclude=rID --exclude=lfSpanFr --exclude=lfSpanTo --output a.mbtiles; mbview a.mbtiles"
end

