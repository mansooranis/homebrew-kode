class Kode < Formula
  desc "Terminal app for reviewing code changes with an AI agent built in"
  homepage "https://github.com/mansooranis/kode"
  url "https://github.com/mansooranis/kode/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "c35bb8f489b2b36aafe672dfde40eb79c4b1fb53a1fd8454bf76ba439672da33"
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
