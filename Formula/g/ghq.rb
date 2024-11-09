class Ghq < Formula
  desc "Remote repository management made easy"
  homepage "https://github.com/x-motemen/ghq"
  url "https://github.com/x-motemen/ghq.git",
      tag:      "v1.7.0",
      revision: "785be66cd2210962f2abf9790b5e6644577488cf"
  license "MIT"
  head "https://github.com/x-motemen/ghq.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fb7d09f3c9a62c0f21b254f2b1098c0a9cea3955d216fc66d52402b3add2755f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4fe79d4cba078614169137f470aff96f6caf945b997c9dead3a23a644021172e"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "ceddd97f41b697dbd1a9b7c0a7f96e90677a1b0738101071e535614cdc064e5d"
    sha256 cellar: :any_skip_relocation, sonoma:        "72edd1840c581cb28cb63c778542cd5923a862f5e3dd49ef95be93b53f274cd7"
    sha256 cellar: :any_skip_relocation, ventura:       "b1fc56201cc8feb513558325bb78a38906481bf5825d201d74ebac9d95cef599"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a5b5beda9520880aaf3330cf32701dbc4e29e44ddf5ca1042989fdd48e4bbee0"
  end

  depends_on "go" => :build

  def install
    system "make", "build", "VERBOSE=1"
    bin.install "ghq"
    bash_completion.install "misc/bash/_ghq" => "ghq"
    zsh_completion.install "misc/zsh/_ghq"
  end

  test do
    assert_match "#{testpath}/ghq", shell_output("#{bin}/ghq root")
  end
end
