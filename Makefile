
# bug report:
#   Javac requires interface on classpath when using impl
#   https://bugs.openjdk.java.net/browse/JDK-8055048
#
# compatibility guide:
#   http://www.oracle.com/technetwork/java/javase/8-compatibility-guide-2156366.html
#   (Synopsis: Interfaces need to be present when compiling against their implementations)
# 
# ECJ must be downloaded from:
#   http://central.maven.org/maven2/org/eclipse/jdt/core/compiler/ecj/4.6.1/ecj-4.6.1.jar
#
# Usage:
#   make rebuild V=ecj
#   make rebuild V=javac

ifeq (${V}, ecj)
JC := java -jar ecj-4.6.1.jar -8
else
JC := javac -source 1.8 -target 1.8 -implicit:none
endif

.PHONY: none lib client clean rebuild

none:

lib: api/a/I.class impl/b/O.class

client: lib client/c/Client.class

clean:
	rm -f api/a/I.class impl/b/O.class client/c/Client.class

rebuild: clean lib client

%.class: %.java
	${JC} ${OPT} $<

impl/b/O.class: OPT = -cp api
#client/c/Client.class: OPT = -cp impl:api
client/c/Client.class: OPT = -cp impl
