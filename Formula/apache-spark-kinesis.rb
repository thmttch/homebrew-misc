require "formula"

class ApacheSparkKinesis < Formula
  homepage "http://spark.apache.org/"
  head "https://github.com/apache/spark.git"
  #url "http://d3kbcqa49mib13.cloudfront.net/spark-1.0.0-bin-hadoop2.tgz"
  url "http://thmttch.net/spark-1.1.0-SNAPSHOT-bin-hadoop2.4.0.tar.gz"
  version "1.1.0-SNAPSHOT"
  sha1 "4ba8be4a91d9a597edf892a394dde7df620be391"

  def install
    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/spark-shell <<<'sc.parallelize(1 to 1000).count()'"
  end
end
