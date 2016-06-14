require "formula"

class Snappysource < Formula
  desc ""
  homepage "https://github.com/xerial/snappy-java"

  url "https://github.com/xerial/snappy-java/archive/1.1.2.1.tar.gz"
  version "1.1.2.1"
  sha256 "6fe2f9823555f6ec25cea878da7a1bce0ce7fdd688381525c74fd0ce6424b74e"

  #depends_on :java => "1.8"
  #depends_on "maven" => :build
  #depends_on "protobuf" => :build
  #depends_on "homebrew/versions/protobuf250" => :build

  # native deps
  #depends_on "cmake" => :build
  #depends_on "openssl" => :build

  def install
    system "build/mvn -Pyarn -Phadoop-2.4 -Dhadoop.version=2.4.0 -DskipTests package"

=begin
    lib.install Dir[
      "hadoop-dist/target/hadoop-#{version}.tar.gz",
      "hadoop-dist/target/hadoop-dist-#{version}.jar",
      "hadoop-dist/target/hadoop-dist-#{version}-javadoc.jar",
    ]
    libexec.install Dir["hadoop-dist/target/hadoop-#{version}/*"]
=end
  end

=begin
  test do
    system "#{bin}/spark-shell <<<'sc.parallelize(1 to 1000).count()'"
  end
=end
end
