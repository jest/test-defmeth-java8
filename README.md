# test-defmeth-java8

A simple show case for differences between ECJ (Eclipse) and javac when compiling against a class implementing some interface — it must be present for javac, but not required for ECJ.

A bug report: [Javac requires interface on classpath when using impl](https://bugs.openjdk.java.net/browse/JDK-8055048)

Oracle compatibility guide: http://www.oracle.com/technetwork/java/javase/8-compatibility-guide-2156366.html (Synopsis: Interfaces need to be present when compiling against their implementations)

ECJ must be downloaded from http://central.maven.org/maven2/org/eclipse/jdt/core/compiler/ecj/4.6.1/ecj-4.6.1.jar

Usage:

    make rebuild V=ecj
    make rebuild V=javac
