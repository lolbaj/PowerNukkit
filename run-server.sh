#!/bin/bash

# Configuration
SERVER_DIR="run-server"
JAR_NAME="Nukkit-PM1E.jar"
SOURCE_JAR="target/$JAR_NAME"
JAVA_HOME_PATH="/data/data/com.termux/files/usr/lib/jvm/java-21-openjdk"

# Memory settings (Adjusted for Helio P70 and 6GB RAM)
MEM_MIN="1G"
MEM_MAX="1536M"

# Java Module Access Flags (Required for Java 17+)
JAVA_OPTS="--add-opens jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.jvm=ALL-UNNAMED \
-XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:ParallelGCThreads=4 -XX:ConcGCThreads=2 -XX:G1NewSizePercent=20 -XX:G1MaxNewSizePercent=30 -XX:G1ReservePercent=15 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1"

# Ensure the JAR exists
if [ ! -f "$SOURCE_JAR" ]; then
    echo "Error: $SOURCE_JAR not found. Please run './mvnw clean package -DskipTests' first."
    exit 1
fi

# Setup server directory
mkdir -p "$SERVER_DIR"
cp "$SOURCE_JAR" "$SERVER_DIR/"
cd "$SERVER_DIR"

# Set JAVA_HOME and run
export JAVA_HOME="$JAVA_HOME_PATH"
echo "Starting PowerNukkit server..."
java $JAVA_OPTS -Xms$MEM_MIN -Xmx$MEM_MAX -jar "$JAR_NAME"
