class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.7/gait_1.0.7_darwin_arm64.tar.gz"
      sha256 "69646c7c7276fab61c2fcc86a35ad245dd2d5388b801e6feea4e38b845a3f1f0"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.7/gait_1.0.7_darwin_amd64.tar.gz"
      sha256 "b7ece4998d97e308e7322eae9fff201574718b20718a8796f2fc7896b17d9eae"
    end
  end

  def install
    bin.install "gait"
  end

  test do
    output = shell_output("#{bin}/gait demo --json")
    assert_match "\"run_id\"", output
  end
end
