@echo off

@call gradlew -b test.gradle -Pinfra=aws createServer || goto :error
@call gradlew -b test.gradle -Pinfra=aws uploadTests runTests || goto :error
@call gradlew -b test.gradle -Pinfra=aws destroyServer || goto :error

@call gradlew -b test.gradle -Pinfra=vagrant createServer || goto :error
@call gradlew -b test.gradle -Pinfra=vagrant uploadTests runTests || goto :error
@call gradlew -b test.gradle -Pinfra=vagrant destroyServer || goto :error

@goto :EOF

:error
@echo Failed with error #%errorlevel%.
@exit /b %errorlevel%

