@echo off

@call gradlew -b test.gradle createServer || goto :error
@call gradlew -b test.gradle uploadTests runTests || goto :error
@call gradlew -b test.gradle destroyServer || goto :error

@goto :EOF

:error
@echo Failed with error #%errorlevel%.
@exit /b %errorlevel%

