class QuiltInstaller < Formula
  desc "Installer for Quilt for the vanilla launcher"
  homepage "https://quiltmc.org/"
  url "https://maven.quiltmc.org/repository/release/org/quiltmc/quilt-installer/0.11.2/quilt-installer-0.11.2.jar"
  sha256 "f6a596ce6857c04e950fb84508f3a8e56e546b6a4a5d8727d878f76af047a41f"
  license "Apache-2.0"

  livecheck do
    url "https://maven.quiltmc.org/repository/release/org/quiltmc/quilt-installer/maven-metadata.xml"
    regex(%r{<version>v?(\d+(?:\.\d+)+)</version>}i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "8c9a7bb80b7a82f27c0132d4991a39f171489492b98c19f224be5de259b8c425"
  end

  depends_on "openjdk"

  def install
    libexec.install "quilt-installer-#{version}.jar"
    bin.write_jar_script libexec/"quilt-installer-#{version}.jar", "quilt-installer"
  end

  test do
    system bin/"quilt-installer", "install", "server", "1.19.2"
    assert_predicate testpath/"server/quilt-server-launch.jar", :exist?
  end
end
