@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements.  See the NOTICE file
@REM distributed with this work for additional information
@REM regarding copyright ownership.  The ASF licenses this file
@REM to you under the Apache License, Version 2.0 (the
@REM "License"); you may not use this file except in compliance
@REM with the License.  You may obtain a copy of the License at
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on an
@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.
@REM ----------------------------------------------------------------------------

@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM
@REM Optional ENV vars
@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven
@REM MAVEN_DEBUG_OPTS (deprecated) - parameters passed to the Maven debug plugin
@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files
@REM ----------------------------------------------------------------------------

@REM Begin of all remarks
@if not "%MAVEN_SKIP_RC%"=="" goto skipRc
@REM check for mavenrc, once at the beginning of the script to keep performance @high as possible
@REM Windows NT/2K/XP
@if exist "%USERPROFILE%\mavenrc" call "%USERPROFILE%\mavenrc"
@REM Windows 9x/ME
@if exist "%HOME%\mavenrc" call "%HOME%\mavenrc"
:skipRc
@REM end of all remarks

setlocal

set MAVEN_CMD_LINE_ARGS=%*

@REM Find the script directory
set M2_HOME=%~dp0
if not "%JAVA_HOME%"=="" goto OkJ
echo.
echo Error: JAVA_HOME is not defined correctly.
echo.  We cannot execute %JAVA_HOME%\bin\java
goto end

:OkJ
@REM find java
if exist "%JAVA_HOME%\bin\java.exe" set JAVACMD=%JAVA_HOME%\bin\java.exe
if not exist "%JAVACMD%" goto error
@REM Add all jars in .mvn/wrapper to classpath
set WRAPPER_JAR=%M2_HOME%\.mvn\wrapper\maven-wrapper.jar
if not exist "%WRAPPER_JAR%" goto error
@REM Execute Maven
set CLASSPATH=%WRAPPER_JAR%

%JAVACMD% %MAVEN_OPTS% %MAVEN_DEBUG_OPTS% -classpath "%CLASSPATH%" -Dwrapper.mavenDistributionUrl=%MAVEN_DISTRIBUTION_URL% -Dwrapper.mavenUrl=%MAVEN_URL% -Dwrapper.mavenDistributionSha256=%MAVEN_DISTRIBUTION_SHA256% -Dwrapper.mavenUrlSha256=%MAVEN_URL_SHA256% -Dwrapper.mavenVersion=%MAVEN_VERSION% org.apache.maven.wrapper.MavenWrapperMain %*

:end
@REM end of script
