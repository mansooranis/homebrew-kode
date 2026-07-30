class Kode < Formula
  desc "Terminal app for reviewing code changes with an AI agent built in"
  homepage "https://github.com/mansooranis/kode"
  url "https://github.com/mansooranis/kode/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "7596bb11add1058f71ec82f2baa9e2fa45cfda26430c1a3f2120cc7bd4326aad"
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
