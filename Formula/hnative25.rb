require "formula"

class Hnative25 < Formula
  desc "hadoop from source with native libraries"
  homepage "https://hadoop.apache.org/"

  #head "https://github.com/apache/spark.git"
  #url "http://d3kbcqa49mib13.cloudfront.net/spark-1.0.0-bin-hadoop2.tgz"
  #url "http://thmttch.net/spark-1.0.3-SNAPSHOT-bin-2.4.0.tgz"
  #url "https://github.com/apache/hadoop.git"
  #version "1.1.0-SNAPSHOT"

  #url "https://github.com/apache/hadoop/archive/rel/release-2.6.4.tar.gz"
  #version "2.6.4"
  #sha1 "117348ad7bc9de652ffb4d9521e80d973b612d87"
  #sha256 "a1c6747ee653d6dd9cd42ad77c48904c2686947fe76eb19c7e186260dfc0bb11"

  version "2.5.2"
  url "https://github.com/apache/hadoop/archive/release-#{version}.tar.gz"
  #sha1 "16a0329d59df119f39802f009c41c84664b149fc"
  #sha256 "a1c6747ee653d6dd9cd42ad77c48904c2686947fe76eb19c7e186260dfc0bb11"

  depends_on :java => "1.7"
  depends_on "maven" => :build
  #depends_on "protobuf" => :build
  depends_on "homebrew/versions/protobuf250" => :build

  # native deps
  depends_on "cmake" => :build
  depends_on "openssl" => :build

    patch do
      url "https://issues.apache.org/jira/secure/attachment/12650756/HDFS-6534.v2.patch"
      sha256 "cfc7bf21897ae6423819f71b524c1b14b8d8771d5e343b29038cce4b1aa2c063"
    end

    patch do
      url "https://issues.apache.org/jira/secure/attachment/12670922/YARN-2161.v2.patch"
      sha256 "017cc5457532c26f7e278f622dc80351aa4b81a17bc2b92e101a22118aba1a93"
    end

  def install
=begin
    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
=end
    #system %w(mvn package -Pdist,native -DskipTests -Dtar)
    #system "mvn", "package", "-Pdist", "-DskipTests", "-Dtar"
    #system({ "OPENSSL_ROOT_DIR" => "/usr/local/opt/openssl" }, "mvn", "package", "-Pdist,native", "-DskipTests", "-Dtar")
    #system "OPENSSL_ROOT_DIR=/usr/local/opt/openssl mvn package -Pdist,native -DskipTests -Dtar"

    system "OPENSSL_ROOT_DIR=/usr/local/opt/openssl mvn package -e -X -Pdist,native -DskipTests -Dtar"

    lib.install Dir[
      "hadoop-dist/target/hadoop-#{version}.tar.gz",
      "hadoop-dist/target/hadoop-dist-#{version}.jar",
      "hadoop-dist/target/hadoop-dist-#{version}-javadoc.jar",
    ]
    libexec.install Dir["hadoop-dist/target/hadoop-#{version}/*"]
  end

=begin
  test do
    system "#{bin}/spark-shell <<<'sc.parallelize(1 to 1000).count()'"
  end
=end
end
