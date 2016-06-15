# https://github.com/Homebrew/homebrew-fuse/blob/master/Formula/s3-backer.rb
class S3Backer142 < Formula
  desc 'FUSE-based single file backing store via Amazon S3'
  homepage 'https://github.com/archiecobbs/s3backer'
  url 'https://github.com/archiecobbs/s3backer/archive/1.4.2.tar.gz'
  sha256 '0cbfd943067f5a6ea8d8883695270ddecb33c82c3150e873769ed5a8c45d1f93'

  depends_on 'pkg-config' => :build
  depends_on 'openssl'
  depends_on 'osxfuse'

  def install
    system './autogen.sh'
    inreplace 'configure', '-lfuse', '-losxfuse'

    # TODO: had to do `brew link openssl --force`, and then drop the FLAGS, and it works
    system 'LDFLAGS=/usr/local/opt/openssl/lib', 'CPPFLAGS=/usr/local/opt/openssl/include', './configure', "--prefix=#{prefix}"
    system 'make', 'install'

    # TODO: now need to install it to the right place
  end

  test do
    system "#{bin}/s3backer", '--version'
  end
end
