class Xonsh < Formula
  include Language::Python::Virtualenv

  desc "Python-powered, cross-platform, Unix-gazing shell language and command prompt"
  homepage "https://xon.sh/"
  url "https://files.pythonhosted.org/packages/13/23/3631d79cd40d32af13dba303a212a8a1879177dd1f9a5ebd04eee8779650/xonsh-0.19.0.tar.gz"
  sha256 "e90cd1a5d7f3ad576c9572b161cb37a1c27872fbb1f5707566bb4a38c6c897af"
  license "BSD-2-Clause-Views"
  head "https://github.com/xonsh/xonsh.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4297e858130c4f8040dd94d828049647d999a36df33ba4cb3146f870f55a760b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fe04f285e60d0412fdfbd60c09506044801fc1a0b28d262ecc5f458bbd31b659"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "240a420ca9c13980c9d5b0f3905e390cfe390ba2a54cd259bf58775f1ccf1302"
    sha256 cellar: :any_skip_relocation, sonoma:        "4734881668ace4b441e7d4b84e9149896af79084e587fffc770ebdaa052162f5"
    sha256 cellar: :any_skip_relocation, ventura:       "c20668af0961848bdbb56a9f1554fb75d3a36a72d519d34d9539f0765383c972"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e916a9da9e0e11871221c7dbe2e5e6282fc9ccb1a52a15225b0a17713a7ff9d6"
  end

  depends_on "python@3.13"

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/2d/4f/feb5e137aff82f7c7f3248267b97451da3644f6cdc218edfe549fb354127/prompt_toolkit-3.0.48.tar.gz"
    sha256 "d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1a03d90"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/8e/62/8336eff65bcbc8e4cb5d05b55faf041285951b6e80f33e2bff2024788f31/pygments-2.18.0.tar.gz"
    sha256 "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
  end

  resource "pyperclip" do
    url "https://files.pythonhosted.org/packages/30/23/2f0a3efc4d6a32f3b63cdff36cd398d9701d26cda58e3ab97ac79fb5e60d/pyperclip-1.9.0.tar.gz"
    sha256 "b7de0142ddc81bfc5c7507eea19da920b92252b548b96186caf94a5e2527d310"
  end

  resource "setproctitle" do
    url "https://files.pythonhosted.org/packages/ae/4e/b09341b19b9ceb8b4c67298ab4a08ef7a4abdd3016c7bb152e9b6379031d/setproctitle-1.3.4.tar.gz"
    sha256 "3b40d32a3e1f04e94231ed6dfee0da9e43b4f9c6b5450d53e6dd7754c34e0c50"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "4", shell_output("#{bin}/xonsh -c 2+2")
  end
end
