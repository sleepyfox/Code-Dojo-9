# This automatically runs both lint on the changed file 
# and the full jasmine test suite

watch('.*\.coffee') {|match| 
	system "echo 'Lint:'; coffeelint #{match}" 
	system "jasmine-node --coffee --verbose test-*.spec.coffee"; }
