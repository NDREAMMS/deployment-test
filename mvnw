#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Maven Start Up Batch script
#
# Required ENV vars:
# ------------------
#   JAVA_HOME - location of a JDK home dir
#
# Optional ENV vars
# -----------------
#   MAVEN_OPTS - parameters passed to the Java VM when running Maven
#   MAVEN_DEBUG_OPTS (deprecated) - parameters passed to the Maven debug plugin
#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files
# ----------------------------------------------------------------------------

if [ -z "$MAVEN_SKIP_RC" ] ; then

  if [ -f /usr/local/etc/mavenrc ] ; then
    . /usr/local/etc/mavenrc
  fi

  if [ -f /etc/mavenrc ] ; then
    . /etc/mavenrc
  fi

  if [ -f "$HOME/.mavenrc" ] ; then
    . "$HOME/.mavenrc"
  fi
fi

# OS specific support.  $var _must_ be set to either true or false.
cygwin=false;
msys=false;
darwin=false;
case "`uname`" in
  CYGWIN* ) cygwin=true ;;
  MINGW* ) msys=true ;;
  Darwin* ) darwin=true ;;
esac

# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`
BASEDIR="$PRGDIR"

case $BASEDIR in
  *" "*) cd "$BASEDIR"
        BASEDIR=`pwd`
        ;;
esac

# If a specific java binary isn't specified then we will use the java from JAVA_HOME
if [ -z "$JAVACMD" ] ; then
  if [ -n "$JAVA_HOME"  ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
      # IBM's JDK on AIX uses strange locations for the executables
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD=`which java`
  fi
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly." 1>&2
  echo "  We cannot execute $JAVACMD" 1>&2
  exit 1
fi

if [ -z "$JAVA_HOME" ] ; then
  JAVA_HOME=`dirname "$dirname "$JAVACMD""`
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if $cygwin ; then
  [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# For MSYS, convert paths to unix.
if $msys ; then
  JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# For OSX, change JAVA_HOME to its 'Home' if it points to a JDK inside an Application bundle
if $darwin ; then
  if [ -d "$JAVA_HOME" ] ; then
    # JAVA_HOME may point to /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home or /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
    JAVA_HOME=`/usr/libexec/java_home 2>/dev/null || true`
  fi
fi

# If the MAVEN_HOME environment variable is set then we can use it to find the Maven distribution
if [ -z "$MAVEN_HOME" ] ; then
  MAVEN_HOME=$BASEDIR
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if $cygwin ; then
  [ -n "$MAVEN_HOME" ] && MAVEN_HOME=`cygpath --unix "$MAVEN_HOME"`
  [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# For MSYS, convert paths to unix.
if $msys ; then
  MAVEN_HOME=`cygpath --unix "$MAVEN_HOME"`
fi

# For OSX, change MAVEN_HOME to its 'Home' if it points to a JDK inside an Application bundle
if $darwin ; then
  if [ -d "$MAVEN_HOME" ] ; then
    # MAVEN_HOME may point to /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home or /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
    MAVEN_HOME=`/usr/libexec/java_home 2>/dev/null || true`
  fi
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if $cygwin ; then
  [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# For MSYS, convert paths to unix.
if $msys ; then
  JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# For OSX, change JAVA_HOME to its 'Home' if it points to a JDK inside an Application bundle
if $darwin ; then
  if [ -d "$JAVA_HOME" ] ; then
    JAVA_HOME=`/usr/libexec/java_home 2>/dev/null || true`
  fi
fi

# If the wrapper distribution has not been downloaded yet, download it
WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

cd "$BASEDIR"
CLASSPATH=$BASEDIR/.mvn/wrapper/maven-wrapper.jar

exec "$JAVACMD" \
  $MAVEN_OPTS \
  $MAVEN_DEBUG_OPTS \
  -classpath "$CLASSPATH" \
  -Dwrapper.mavenDistributionUrl="$MAVEN_DISTRIBUTION_URL" \
  -Dwrapper.mavenUrl="$MAVEN_URL" \
  -Dwrapper.mavenDistributionSha256="$MAVEN_DISTRIBUTION_SHA256" \
  -Dwrapper.mavenUrlSha256="$MAVEN_URL_SHA256" \
  -Dwrapper.mavenVersion="$MAVEN_VERSION" \
  org.apache.maven.wrapper.MavenWrapperMain "$@"
