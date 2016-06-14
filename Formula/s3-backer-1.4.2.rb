# https://github.com/Homebrew/homebrew-fuse/blob/master/Formula/s3-backer.rb
class S3Backer142 < Formula
  desc 'FUSE-based single file backing store via Amazon S3'
  homepage 'https://github.com/archiecobbs/s3backer'
  url 'https://github.com/archiecobbs/s3backer/archive/1.4.2.tar.gz'
  sha256 '7a6f028d16301b0fd32679eebe34ff2d614f343979ee7a0fab0110b85934aaca'

  depends_on 'pkg-config' => :build
  depends_on 'openssl'
  depends_on :osxfuse

  def install
    inreplace 'configure', '-lfuse', '-losxfuse'

    system './configure', "--prefix=#{prefix}"
    system 'make', 'install'
  end

  test do
    system "#{bin}/s3backer", '--version'
  end
end
