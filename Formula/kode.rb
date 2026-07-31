class Kode < Formula
  desc "Terminal app for reviewing code changes with an AI agent built in"
  homepage "https://github.com/mansooranis/kode"
  url "https://github.com/mansooranis/kode/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "ce32c7016ea1b082496830ba51347267ce089ae7f7ceb21de70340e06c370f9b"
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
