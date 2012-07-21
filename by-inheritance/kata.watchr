# This automatically runs the vows tests
watch('.*\.coffee') {|match| system "jasmine-node --coffee --verbose test-*.spec.coffee"}
