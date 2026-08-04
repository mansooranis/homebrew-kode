class Kode < Formula
  desc "Terminal app for reviewing code changes with an AI agent built in"
  homepage "https://github.com/mansooranis/kode"
  url "https://github.com/mansooranis/kode/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "2f44e083e0d79a68a18446185e690dd4134e8838ce549433c5bd88180dcfc11e"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/mansooranis/kode/internal/buildinfo.Version=v#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"kode", "./cmd/kode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kode version")
  end
end
