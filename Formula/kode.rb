class Kode < Formula
  desc "Terminal app for reviewing code changes with an AI agent built in"
  homepage "https://github.com/mansooranis/kode"
  url "https://github.com/mansooranis/kode/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "9497d1a80c4f7df068e4decc2da45a617765b1229cf4697d1816382aa1e931a0"
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
