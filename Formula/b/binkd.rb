class Binkd < Formula
  desc "TCP/IP FTN Mailer"
  homepage "https://github.com/pgul/binkd"
  url "https://happy.kiev.ua/pub/fidosoft/mailer/binkd/binkd-1.0.4.tar.gz"
  sha256 "917e45c379bbd1a140d1fe43179a591f1b2ec4004b236d6e0c4680be8f1a0dc0"
  license "GPL-2.0-or-later"
  head "https://github.com/pgul/binkd.git", branch: "master"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "203981e9bb0598dcb33b83b50bb8af30688d8e661896d3b4dac8ca7408510cb0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "18c117512a766e75cdca7fd46a2f67388e20935cd7acfc2a34f5f08950615848"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "b2df2fde26d69ad428bcc89b4108fee501ebf175a068db94ea97366212d66e7c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ea0018141c5ebc35b7dca7fb49322682120a2eb5868eb16ff40c8f670123a3fc"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "4cd8c44619d3c04b646a1ea8ad7db21feb95e950656c78d5dc1a983d6472b469"
    sha256 cellar: :any_skip_relocation, sonoma:         "e8d50f0c28fd306141d748253590c49e783d5441cf3a4ffed486b8eb2120da17"
    sha256 cellar: :any_skip_relocation, ventura:        "5ffb321d48d1c22395d4c0453ebd2794a12ab267eb67117b17aa66004e0f5175"
    sha256 cellar: :any_skip_relocation, monterey:       "111b63381a81029c8e2b1618e34d7f6def295e9abd5f6b4c2073b636650ad026"
    sha256 cellar: :any_skip_relocation, big_sur:        "3b309f2c4a6ee43441a32c0396a570454737bb85c5467f3e27a8c666140bda59"
    sha256 cellar: :any_skip_relocation, catalina:       "263219b174c193cd86454770d838013daa797994d8d21cdca45493a59d8a5a79"
    sha256 cellar: :any_skip_relocation, mojave:         "1582b44b77979d7258c51baec8bb54f367fc21f8cc03838c9c1b1351ea9f77e7"
    sha256 cellar: :any_skip_relocation, high_sierra:    "e890bed8ae5c89dfabd589e2c9654b2c8da6811bd24fbfd99aa4fc520a535e26"
    sha256 cellar: :any_skip_relocation, sierra:         "d685be9cb23ecb98dc34c2ea185c47ec39e54db1a8ca88782d11cbd96c78862a"
    sha256 cellar: :any_skip_relocation, el_capitan:     "d69c67a3cb68789a0a96196b5d2d92e44e6dd9bab3eb870ec9727987ae538c35"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "83ac41663d506bea26d30d168d2b5193f2d42da32ed8530ec8422f990281c3b7"
  end

  uses_from_macos "zlib"

  def install
    cp Dir["mkfls/unix/*"].select { |f| File.file? f }, "."
    inreplace "binkd.conf", "/var/", "#{var}/" if build.stable?
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "#{sbin}/binkd", "-v"
  end
end
