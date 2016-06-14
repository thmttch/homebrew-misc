require "formula"

class Sparksource < Formula
  desc ""
  homepage "http://spark.apache.org/docs/latest/building-spark.html"

  url "http://www.gtlib.gatech.edu/pub/apache/spark/spark-1.6.1/spark-1.6.1.tgz"
  version "1.6.1"
  sha256 "5b7b6a0332449ce74b3e595fe2dfe0900c69fc72677db18f01f2a637bc84c81c"

  depends_on :java => "1.8"
  depends_on "maven" => :build
  #depends_on "protobuf" => :build
  depends_on "homebrew/versions/protobuf250" => :build

  # native deps
  depends_on "cmake" => :build
  depends_on "openssl" => :build

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
